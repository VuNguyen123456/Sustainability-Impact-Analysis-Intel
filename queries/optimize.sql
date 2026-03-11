-- ============================================================
-- Optimizing Repurposing Strategy for Maximum Impact
-- ============================================================
-- Extends the regional analysis by calculating each device
-- type's percentage contribution to energy savings and CO₂
-- reductions within each region.
-- ============================================================


-- Percentage of total energy savings and CO₂ reductions
-- contributed by each device type within each region
WITH intel_data AS (
    SELECT
        *,
        (2024 - device.model_year) AS device_age,
        CASE
            WHEN (2024 - device.model_year) <= 3 THEN 'newer'
            WHEN (2024 - device.model_year) <= 6 THEN 'mid-age'
            ELSE 'older'
        END AS device_age_bucket
    FROM
        intel.device_data AS device
        INNER JOIN intel.impact_data AS impact ON device.device_id = impact.device_id
),
region_totals AS (
    -- Total energy and CO₂ savings per region (denominator)
    SELECT
        region,
        SUM(energy_savings_yr)  AS total_energy_savings_region,
        SUM(co2_saved_kg_yr)    AS total_co2_savings_region
    FROM
        intel_data
    GROUP BY
        region
),
device_totals AS (
    -- Total energy and CO₂ savings per device type per region (numerator)
    SELECT
        region,
        device_type,
        SUM(energy_savings_yr)  AS total_energy_savings_device_type,
        SUM(co2_saved_kg_yr)    AS total_co2_savings_device_type
    FROM
        intel_data
    GROUP BY
        region,
        device_type
)
SELECT
    a.region,
    a.device_type,
    COUNT(*)                                                        AS total_repurposed,
    AVG(device_age)                                                 AS avg_age,
    AVG(energy_savings_yr)                                          AS avg_energy_savings_kwh,
    AVG(co2_saved_kg_yr) / 1000                                     AS avg_co2_saved_tons,
    (c.total_energy_savings_device_type / b.total_energy_savings_region) * 100  AS pct_energy_contribution,
    (c.total_co2_savings_device_type    / b.total_co2_savings_region)    * 100  AS pct_co2_contribution
FROM
    intel_data AS a
    INNER JOIN region_totals  AS b ON a.region      = b.region
    INNER JOIN device_totals  AS c ON a.device_type = c.device_type
                                   AND a.region     = c.region
GROUP BY
    a.region,
    a.device_type,
    c.total_energy_savings_device_type,
    b.total_energy_savings_region,
    c.total_co2_savings_device_type,
    b.total_co2_savings_region;
-- Results:
--   Laptops in Asia contributed the most energy savings and CO₂ reductions
--   relative to device count. Laptops in Europe were a close second.
--
-- Strategic Implication:
--   Intel should prioritize laptop repurposing campaigns in Asia to maximize
--   environmental ROI. Combining this with an older-device incentive program
--   would compound the sustainability impact significantly.

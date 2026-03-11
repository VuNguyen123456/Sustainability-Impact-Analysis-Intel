-- ============================================================
-- Task 3: Identifying Trends & Maximizing Sustainability
-- ============================================================
-- Group by device type, device age bucket, and region
-- to uncover where repurposing has the greatest impact.
-- ============================================================


-- 3A. Grouped by device_type
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
)
SELECT
    device_type,
    COUNT(*)                    AS total_repurposed,
    AVG(device_age)             AS avg_age,
    AVG(energy_savings_yr)      AS avg_energy_savings_kwh,
    AVG(co2_saved_kg_yr) / 1000 AS avg_co2_saved_tons
FROM
    intel_data
GROUP BY
    device_type;
-- Results:
--   Laptop:  408,064 devices | avg 25.80 kWh | avg 0.01128 tons CO₂
--   Desktop: 193,676 devices | avg 25.62 kWh | avg 0.01119 tons CO₂
--
-- Insight: Laptops slightly outperform desktops in both metrics.
-- Likely because laptops are replaced more frequently due to
-- mobility needs and faster perceived obsolescence.


-- 3B. Grouped by device_age_bucket
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
)
SELECT
    device_age_bucket,
    COUNT(*)                    AS total_repurposed,
    AVG(device_age)             AS avg_age,
    AVG(energy_savings_yr)      AS avg_energy_savings_kwh,
    AVG(co2_saved_kg_yr) / 1000 AS avg_co2_saved_tons
FROM
    intel_data
GROUP BY
    device_age_bucket;
-- Insight: The older the device, the greater its energy savings and CO₂
-- reduction when repurposed. Devices 6+ years old have the highest
-- per-unit sustainability impact — yet they are the least-represented
-- group being repurposed (most repurposed devices are newer).


-- 3C. Grouped by region
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
)
SELECT
    region,
    COUNT(*)                    AS total_repurposed,
    AVG(device_age)             AS avg_age,
    AVG(energy_savings_yr)      AS avg_energy_savings_kwh,
    AVG(co2_saved_kg_yr) / 1000 AS avg_co2_saved_tons
FROM
    intel_data
GROUP BY
    region;
-- Insight: Repurposing in high carbon-intensity electricity regions (Asia)
-- produces greater CO₂ savings per device because each kWh saved
-- displaces dirtier grid electricity compared to cleaner grids in Europe.

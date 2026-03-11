-- ============================================================
-- Task 2: Key Insights
-- ============================================================
-- Program-wide totals and averages for Intel's 2024
-- repurposing program using the WITH (CTE) pattern.
-- ============================================================


-- 2A. Total number of devices repurposed in 2024
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
    COUNT(*) AS total_devices_repurposed
FROM
    intel_data;
-- Result: 601,740 total devices


-- 2B. Program-wide summary: total devices, avg age,
--     avg energy savings (kWh), and total CO₂ saved (tons)
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
    COUNT(*)                    AS total_repurposed,
    AVG(device_age)             AS avg_device_age,
    AVG(energy_savings_yr)      AS avg_energy_savings_kwh,
    SUM(co2_saved_kg_yr) / 1000 AS total_co2_saved_tons,
    SUM(energy_savings_yr)      AS total_energy_saved_kwh
FROM
    intel_data;
-- Results:
--   Total repurposed:       601,740
--   Avg energy savings:     ~25.74 kWh/device/year
--   Total CO₂ saved:        6,768.42 tons/year
--   Total energy saved:     15,490,046.8 kWh/year
--
-- Real-world context (via scale comparison):
--   ~1,460 households powered for a year
--   ~1,470 cars removed from the road for a year

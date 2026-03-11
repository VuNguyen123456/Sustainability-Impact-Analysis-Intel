-- ============================================================
-- Task 1: Organizing and Understanding the Data
-- ============================================================
-- Join device_data and impact_data, calculate device age,
-- and bucket devices into age categories for analysis.
-- ============================================================


-- 1A. Join both tables on device_id
SELECT
    *
FROM
    intel.device_data AS device
    INNER JOIN intel.impact_data AS impact ON device.device_id = impact.device_id;


-- 1B. Add calculated column: device_age (years since manufacture)
SELECT
    *,
    (2024 - device.model_year) AS device_age
FROM
    intel.device_data AS device
    INNER JOIN intel.impact_data AS impact ON device.device_id = impact.device_id;


-- 1C. Count newer vs. older devices being repurposed
-- Newer devices (< 5 years old)
SELECT
    COUNT(*) AS newer_device_count
FROM
    intel.device_data AS device
    INNER JOIN intel.impact_data AS impact ON device.device_id = impact.device_id
WHERE
    (2024 - device.model_year) < 5;
-- Result: 437,017 devices under 5 years old

-- Older devices (5+ years old)
SELECT
    COUNT(*) AS older_device_count
FROM
    intel.device_data AS device
    INNER JOIN intel.impact_data AS impact ON device.device_id = impact.device_id
WHERE
    (2024 - device.model_year) >= 5;
-- Result: 164,723 devices 5+ years old
-- Insight: Newer devices dominate repurposing — individuals and corporations
-- replace functional devices because newer hardware offers better performance,
-- making even recent devices "outdated" relative to the latest models.


-- 1D. Add device_age_bucket using CASE WHEN
--   newer  = device_age <= 3
--   mid-age = device_age 4–6
--   older  = device_age > 6
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
    INNER JOIN intel.impact_data AS impact ON device.device_id = impact.device_id;

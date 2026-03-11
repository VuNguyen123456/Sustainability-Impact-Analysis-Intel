# Sustainability Impact Analysis — Intel

![SQL](https://img.shields.io/badge/SQL-PostgreSQL-blue)
![Data Analysis](https://img.shields.io/badge/Analysis-Data--Driven-green)
![Intel](https://img.shields.io/badge/Client-Intel-0071C5)

> Analyzed Intel's 2024 device repurposing program across 600,000+ records to evaluate environmental impact and provide data-driven recommendations for maximizing sustainability outcomes.

---

## Project Overview

Intel runs a large-scale repurposing program to reduce e-waste, energy consumption, and CO₂ emissions by extending the life of existing devices instead of manufacturing new ones. The challenge: **which devices should be prioritized for maximum environmental benefit?**

This project uses SQL to query and analyze two joined datasets — device data and impact data — to uncover trends across device type, age, and region, ultimately producing actionable recommendations for Intel's sustainability team.

> **Note:** The dataset used in this project was provided by The Global Career Accelerator and is designed to reflect the key characteristics of Intel's real data while protecting proprietary information. The dataset is not included in this repository.

---

## Data Schema

### `intel.device_data`
| Column | Description |
|---|---|
| `device_id` | Unique identifier for each repurposed device |
| `device_type` | "Laptop" or "Desktop" |
| `model_year` | Year the device was manufactured |

### `intel.impact_data`
| Column | Description |
|---|---|
| `impact_id` | Unique identifier for the impact record |
| `device_id` | Foreign key linking to `device_data` |
| `usage_purpose` | Repurposing category (Education, Corporate, Government, etc.) |
| `power_consumption` | Power usage in watts (W) |
| `energy_savings_yr` | Estimated energy savings per year (kWh) |
| `co2_saved_kg_yr` | Estimated CO₂ saved per year (kg) |
| `recycling_rate` | Percentage of device that is recyclable |
| `region` | North America, Europe, or Asia |

---

## Key Findings

### 📊 Program Scale (2024)
| Metric | Value |
|---|---|
| Total devices repurposed | **601,740** |
| Total energy saved | **15,490,046.8 kWh/year** |
| Total CO₂ reduced | **6,768.42 tons/year** |
| Real-world equivalent | ~1,460 households powered for a year |
| Real-world equivalent | ~1,470 cars removed from the road |

### 🔋 Device Age vs. Impact
Older devices deliver significantly higher sustainability returns when repurposed:

| Age Bucket | Avg Energy Savings | Avg CO₂ Saved |
|---|---|---|
| Newer (≤3 yrs) | Lower | Lower |
| Mid-age (4–6 yrs) | Moderate | Moderate |
| Older (6+ yrs) | **Highest** | **Highest** |

> Devices older than 6 years show the most significant gains — yet **newer devices made up the majority** of what was repurposed in 2024 (437,017 newer vs. 164,723 older).

### 💻 Device Type Breakdown
Laptops slightly outperform desktops in both average energy savings and CO₂ reduction per device, likely due to higher replacement frequency and broader consumer adoption.

| Device Type | Count | Avg Energy Savings (kWh) | Avg CO₂ Saved (tons) |
|---|---|---|---|
| Laptop | 408,064 | 25.80 | 0.01128 |
| Desktop | 193,676 | 25.62 | 0.01119 |

### 🌍 Regional Impact
Repurposing in high carbon-intensity electricity regions (like Asia) produces greater CO₂ savings per device, since each kWh saved displaces dirtier grid electricity.

---

## Recommendations

Based on the analysis, three strategic recommendations for Intel:

1. **Prioritize older devices (6+ years)** — These deliver the highest energy and CO₂ savings per unit. Intel should create incentive programs that reward users for returning older devices rather than newer ones.

2. **Target high carbon-intensity regions** — Focus repurposing expansion in Asia and high-carbon areas of North America where each device repurposed has an outsized environmental impact.

3. **Implement continuous tracking** — Build reporting mechanisms that monitor average device age, energy savings, and CO₂ reductions by region over time, enabling dynamic strategy adjustments.

---

## SQL Query Structure

| File | Description |
|---|---|
| `queries/01_data_setup.sql` | Join tables, calculate device age, apply age bucketing |
| `queries/02_key_insights.sql` | Program-wide totals and averages |
| `queries/03_trends.sql` | Grouped analysis by device type, age bucket, and region |
| `queries/04_levelup.sql` | Advanced: % contribution by device type within each region |

---

## Skills Demonstrated

- Complex SQL joins across multiple tables (`INNER JOIN`)
- Derived columns and conditional logic (`CASE WHEN`)
- Aggregation and grouping (`GROUP BY`, `COUNT`, `AVG`, `SUM`)
- CTEs for readable multi-step queries (`WITH`)
- Window-style percentage calculations across groups
- Data-driven analysis and business recommendation writing

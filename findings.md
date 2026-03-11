# Analysis Findings & Recommendations

## Data Organization

After joining `intel.device_data` and `intel.impact_data` on `device_id` and ordering by model year, a clear pattern emerged: **newer devices dominate the repurposing pool**.

- **437,017** devices under 5 years old were repurposed
- **164,723** devices 5+ years old were repurposed

This indicates that individuals and corporations replace devices even while they are still functional. Newer hardware offers better performance each year, making even relatively recent devices feel outdated compared to the latest models — and therefore available for repurposing sooner than expected.

---

## Key Insights

| Metric | Value |
|---|---|
| Total devices repurposed | 601,740 |
| Average energy savings per device | ~25.74 kWh/year |
| Total energy saved | 15,490,046.8 kWh/year |
| Total CO₂ reduced | 6,768.42 tons/year |

**To put this in perspective:**
- The yearly energy savings are roughly equivalent to **powering ~1,460 households** for a year
- The CO₂ savings equal **removing ~1,470 cars** from the road for a year

---

## Trends

### By Device Type
Laptops slightly outperform desktops in both average energy savings and CO₂ reduction per device. This is likely because laptops are replaced more frequently due to mobility needs and the faster perceived obsolescence of portable hardware.

### By Device Age
The older the device, the greater its sustainability impact when repurposed. Devices in the 6+ year range showed the highest per-unit energy savings and CO₂ reductions — yet this age group represents the **minority** of what is actually being repurposed.

### By Region
Repurposing in high carbon-intensity electricity regions (such as Asia) produces greater CO₂ savings per device. In regions with dirtier electricity grids, each kWh saved by repurposing instead of manufacturing new displaces more carbon-heavy energy generation.

---

## Recommendations

### Key Takeaways
1. Older devices (6+ years) have a significantly more positive impact on energy savings and CO₂ reductions compared to newer ones — this is the highest-leverage variable in the dataset.
2. Devices in the 4.7–7.3 year range, especially those older than 6 years, show the most substantial sustainability returns when repurposed.
3. Repurposing in high carbon-intensity regions (Asia, parts of North America) has a disproportionately large impact on total CO₂ savings due to dirtier baseline electricity grids.
4. Device type (Laptop vs. Desktop) has a smaller impact on sustainability outcomes compared to device age — age is the primary driver.

### Strategic Recommendation
Intel should **shift its repurposing program to prioritize older devices** (6+ years) through user incentive programs that make it more rewarding to return aging hardware than newer devices. Simultaneously, Intel should **concentrate repurposing expansion efforts in Asia and high-carbon regions of North America**, where each repurposed device delivers the greatest environmental return.

Finally, Intel should implement continuous tracking of average device age, energy savings, and CO₂ reductions by region to enable dynamic strategy adjustment over time — the same kind of analysis done here, run on a recurring basis.

---

## % Contribution by Device Type per Region

**Laptops in Asia** contributed the most energy savings and CO₂ reductions relative to their device count, with Laptops in Europe as a close second.

**Implication:** Prioritizing laptop repurposing campaigns in Asia, combined with an older-device incentive program, would compound the sustainability impact significantly and represent Intel's highest-ROI strategy for maximizing environmental benefit per program dollar spent.

### Additional Metrics Worth Tracking
- **Cost per repurposed device** — enables cost-effectiveness analysis alongside sustainability metrics, helping Intel balance environmental goals with budget constraints
- **Time to repurpose** — reveals operational efficiency gaps across regions and device types, enabling better manpower allocation and process optimization

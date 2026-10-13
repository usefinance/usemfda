# Week 6 exercise data

The current exercise pair contains seven independent sets using ECB, Kenneth French, FRED, FinanceDatabase/FinanceToolkit, Cookson and coauthors' Social Signal indices, and SBTi. Each set loads its own inputs; no exercise answer is a prerequisite for another. CSV calculations use offline copies or a fixed GitHub snapshot. Part 2 also queries a pinned original FinanceDatabase catalogue through the library and uses FinanceToolkit's ratio controller, so it needs internet access for those library calls. No data-access API key is required. The World Bank and Cboe extracts are retained from preceding drafts, but their exercises have been replaced.

## FinanceDatabase + FinanceToolkit peer analysis

The exercise identifies AMD, Intel, NVIDIA and Texas Instruments from six candidate US companies. FinanceDatabase is queried at fixed commit `178886f064f0cfa787104ea6b4c3cc85657868d7`, using primary listings, USD currency, United States country and the `Semiconductors & Chip Equipment` industry. An optional six-company reference export is retained in `bouma_equities_reference.csv`.

The supplied normalised statements were obtained using FinanceToolkit 2.1.4 with YahooFinance on 13 October 2026. `toolkit_balance.csv`, `toolkit_income.csv` and `toolkit_cash.csv` contain ticker/metric/annual-period/value records in USD for the provider-normalised 2023–2025 periods, including original missing fields. `toolkit_prices.csv` is a saved daily historical-data input from the same library for 2023–2025. Financial statements and price inputs are reconstructed to the library's MultiIndex format by the supplied notebook setup. The ratios are calculated by FinanceToolkit, not copied from a provider's ratio field. They are verified directly against net income/revenue and net income/average opening and closing assets.

FinanceToolkit maps NVIDIA's January fiscal-year end to a preceding calendar label. Therefore annual labels do not imply identical statement dates across companies. The catalogue snapshot and statement snapshot are retrospective inputs; the exercise does not claim a point-in-time historical stock-selection backtest.

The shared course environment pins FinanceToolkit 2.1.4 and FinanceDatabase 2.4.0 to retain its existing pandas version. Source snapshots and verification are in `tmp/week6_toolkit_social/` in the instructor workspace. Course entry point: https://usefinance.github.io/data/other-sources/python-tools/

## Cookson social-media indices

`cookson_social_signal.csv` uses the disclosed observed **Social Signal Index**, separate from the simulated stand-in data in the larger replication package. The original `social_signal_index.dta` contains 821,534 firm-day rows for 2012–2021. We selected firm identifiers 10107, 14593, 86580 and 93436 for 2020–2021 (2,020 rows), renamed `permno` to `firm_id`, `zee_sent_pc` to `sentiment_index` and `zee_attn_pc` to `attention_index`, and converted Stata to CSV with 12 significant digits. No observations or index values were invented, and no PCA was recalculated. Identifiers are retained without an invented ticker/name crosswalk.

The supplied indices are standardised first principal components constructed from StockTwits, Twitter and Seeking Alpha. They are dimensionless scores rather than message counts, sentiment percentages, returns or investor counts. They were estimated retrospectively across the authors' historical sample. The notebook fits same-day attention–sentiment associations; it does not represent a real-time forecast or trading backtest.

Attribution: J. Anthony Cookson, Runjing Lu, William Mullins and Marina Niessner (2024), *The Social Signal*. Dataset version 1, DOI [10.17632/xffyybvw4j.1](https://doi.org/10.17632/xffyybvw4j.1). Shared under [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/); the selected rows, column renaming and format conversion above are the changes made. No endorsement by the authors is implied.

Author's data page: https://sites.google.com/site/tonycookson/data-and-programs

Data and original README: https://data.mendeley.com/datasets/xffyybvw4j/1

Course pointer: https://usefinance.github.io/data/other-sources/social-media/

## Additional sources used by the independent sets

| File | Source and units | Preparation |
| --- | --- | --- |
| `ecb_fx_monthly.csv` | ECB reference rates: USD, GBP, JPY units per EUR | Last observed quote each month, December 2019–December 2025; retains actual quote dates. Spot rates exclude interest and trading costs. |
| `size_value_returns.csv` | French 6 Portfolios Formed on Size and Book-to-Market: value-weighted monthly USD total returns | January 2020–December 2025; divide source percentages by 100. No fund-fee adjustment. |
| `treasury_yields_monthly.csv` | Federal Reserve H.15 via FRED, `DGS2`, `DGS5`, `DGS10`, `DGS30`, annual yields in percentage units | December 2019–December 2025, last observation date each month with all four series present; retains actual dates. These are yields, not realised bond returns. |
| `country_growth.csv` (previous draft) | World Bank WDI `NY.GDP.MKTP.KD.ZG`, annual real GDP growth | Retained 2000–2024 observations; no longer used by the current exercise pair. CC BY-4.0. |
| `sbti_company_targets.csv` | SBTi by-company target registry; near-term and net-zero statuses are categories | Snapshot retrieved 13 October 2026. 2,324 unique firm IDs in six sectors and three regions. Near-term statuses are complete; 1,428 net-zero statuses are blank. Includes corporate, SME and financial-institution entries. These are target records, not overall ESG scores or verified emissions outcomes. |
| `vix_daily.csv` (previous draft) | Cboe VIX observed daily closing index points | Retained 2020–2025 observations; no longer used by the current exercise pair. |

Direct downloads:

- ECB: https://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist.zip
- French: https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/6_Portfolios_2x3_CSV.zip
- FRED: https://fred.stlouisfed.org/graph/fredgraph.csv?id=DGS2,DGS5,DGS10,DGS30&cosd=2019-12-01&coed=2025-12-31
- World Bank: https://api.worldbank.org/v2/country/FRA;DEU;ITA;ESP;NLD;WLD/indicator/NY.GDP.MKTP.KD.ZG?date=2000:2024&format=json&per_page=500
- SBTi by-company: https://files.sciencebasedtargets.org/production/files/companies-excel.xlsx
- SBTi data dictionary: https://files.sciencebasedtargets.org/production/files/Alpha-Dashboard-Data-Dictionary.xlsx
- Cboe: https://cdn-api.cboe.com/api/global/us_indices/daily_prices/VIX_History.csv

Course pointers: [FX](https://usefinance.github.io/data/other-sources/foreign-exchange/), [equities and volatility](https://usefinance.github.io/data/other-sources/asset-pricing/), [fixed income](https://usefinance.github.io/data/other-sources/bonds/), [country data](https://usefinance.github.io/data/other-sources/macro-country-data/), [firm-level ESG](https://usefinance.github.io/data/other-sources/esg/firm-level/).

These new extracts were retrieved on 13 October 2026; source bytes, hashes, unit conversions and validation are retained in `tmp/week6_independent_sources/` in the instructor workspace. No source observations were invented. Only the duplicate FX export row, the VIX stress threshold, the regression scenario, and the sector portfolio weights are teaching inputs.

The SBTi subset covers Automobiles and Components; Banks, Diverse Financials, Insurance; Chemicals; Food and Beverage Processing; Software and Services; and Technology Hardware and Equipment, in Northern America, Northern Europe and Western Europe. The CSV retains source ID, company name, organisation type, location, region, sector and both status fields without inventing or imputing status values. The source and dictionary downloads, byte hashes and validation are in `tmp/week6_esg/`. Shares describe this selected registry sample, not the prevalence of targets among all firms in each sector or region. A blank net-zero status means no status is recorded in the extract and must not be interpreted as an adverse ESG score.

## Retained French industry and market snapshot

Observed monthly US industry portfolio returns and market/cash returns from the Kenneth French Data Library. Selected period: January 2020–December 2025. Retrieved 13 October 2026 from the August 2026 CRSP-based release.

Course entry point: https://usefinance.github.io/data/other-sources/asset-pricing/

Related WRDS guide: https://usefinance.github.io/data/wrds/databases/fama-french/

Original downloads:

- https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/12_Industry_Portfolios_CSV.zip
- https://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/F-F_Research_Data_Factors_CSV.zip

`industry_returns.csv` has one industry-month per row, with observed value-weighted and equal-weighted total returns for all 12 source industries (864 rows). Both include distributions; neither is net of fund management fees. `industry_name` is a descriptive label for the source's industry code. Currency: USD.

`market_returns.csv` has one month per row (72 rows). `market_excess` is source `Mkt-RF`; `monthly_rf` is source `RF`. `benchmark_return` is their sum, the broad US market total return. RF is the source's one-month Treasury bill series: Ibbotson Associates through May 2024, ICE BofA US 1-Month Treasury Bill Index from June 2024.

All CSV returns are **decimals**, converted from source percentage values by dividing by 100. Dates are calendar month-end labels, not necessarily trading dates. There are no missing observations or missing-return sentinels in the selected sample.

`industry_indices.csv` contains **derived total-return indices**, not observed prices or NAVs. Each starts at 100 on 31 December 2019 and compounds the value-weighted monthly returns of BusEq, Money, or Utils through December 2025 (219 rows including the three starting values). It is retained from the earlier draft; the current seven-set notebook uses observed ECB quotes for the ordered-change exercise.

The exercise notebook deliberately duplicates and shuffles one FX extract. Its sector attribution uses illustrative beginning weights and observed equal-weighted versus value-weighted industry returns. The assumed weights do not describe any actual fund or the broad market's industry holdings.

Historical source data can be revised. The notebooks use a fixed GitHub commit and matching offline copies for reproducible expected outputs. Source archive hashes are retained in `tmp/week6_real_data/provenance.json` in the instructor workspace.

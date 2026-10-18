# Week 7 plotting exercises

Six small, fictional teaching tables, supplied in plotting order. No live financial observations or personal data. Each notebook exercise loads one CSV directly into a pandas DataFrame. No cleaning, derived calculations, or data retrieval code needs to be written by students.

| File | Columns | Units |
|---|---|---|
| monthly_sales.csv | month, sales | Month number, EUR thousands |
| branch_revenue.csv | branch, revenue | Branch name, EUR thousands |
| advertising.csv | spend, visits | EUR thousands, website-visit count |
| delivery_times.csv | minutes | One delivery per row, minutes |
| department_spending.csv | department, budget, actual | Department name, amounts in EUR thousands |
| shop_visitors.csv | month, shop_a, shop_b | Month number, visitor counts |

## Finance-context alternatives

These fictional, precomputed tables replace the first three exercise contexts. The original tables remain available. No real security forecasts or observations are supplied.

| File | Columns | Meaning and units |
|---|---|---|
| fund_nav.csv | month, nav | Month number, month-end NAV in EUR per fund unit |
| asset_alpha.csv | asset, expected_alpha_pp | Fictional asset label, forecast annual return minus required annual return in percentage points |
| return_predictions.csv | predicted_return_pct, realized_return_pct | One asset per row. Prior forecast and realized return over the same year, in percent (7 means 7%) |

The expected-alpha chart is an asset-screening display, not an optimal allocation rule. The prediction chart uses supplied forecasts and does not require fitting a model.

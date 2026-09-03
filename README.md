# Sales Operations Analytics

## Project Overview

An end-to-end sales analytics project using Python, SQL, SQLite, statistical modeling, time-series forecasting, and Power BI.

The objective was to analyze sales and profitability, identify discount-related business risks, investigate regional and product-level performance, and forecast future monthly sales.

---

## Business Questions

- Which regions generate the highest sales and profit?
- Which regions have weak profitability?
- What is the relationship between discounting and profit?
- Which product categories and products contribute to losses?
- Does high discounting appear to be a persistent issue?
- Can historical sales patterns be used to forecast future sales?

---

## Dataset

- 10,194 sales transactions
- 21 variables
- Historical period: 2023–2026
- Missing values: 0
- Duplicate rows: 0

---

## Technology Stack

- Python
- pandas
- NumPy
- Matplotlib
- Seaborn
- scikit-learn
- statsmodels
- Jupyter
- SQLite
- SQL
- Power BI

---

## Analysis Workflow

### 1. Data Validation

Performed:

- Missing-value checks
- Duplicate-row checks
- Data-type validation
- Date conversion
- Numeric-field validation

### 2. Exploratory Analysis

Analyzed:

- Sales
- Profit
- Profit margin
- Quantity
- Regional performance
- Discount levels
- Product and sub-category performance

### 3. SQL Analytics

Created a SQLite database and analyzed:

- Monthly sales and profit
- Regional profitability
- Loss-making products
- Discount-level profitability
- Central-region high-discount exposure

### 4. Statistical Analysis

Performed:

- Correlation analysis
- Simple linear regression
- Multiple linear regression
- Variance Inflation Factor (VIF)
- HC3 heteroskedasticity-robust standard errors

### 5. Forecasting

Created a monthly sales time series and evaluated:

- Naive forecasting baseline
- Holt-Winters exponential smoothing
- Trend
- 12-month seasonality

---

## Key Business Findings

### Regional Profitability

The West region generated the highest sales and profit, while Central had the lowest profit margin.

| Region | Sales | Profit | Profit Margin |
|---|---:|---:|---:|
| West | $739,813.61 | $110,798.82 | 14.98% |
| East | $691,828.17 | $94,883.26 | 13.71% |
| South | $391,721.91 | $46,749.43 | 11.93% |
| Central | $503,170.67 | $39,865.31 | 7.92% |

### Discounting

Discount and profit had a negative correlation of approximately -0.219.

Transactions with discounts of 30% or higher generated:

- $364,760 in sales
- -$136,021 in aggregate profit
- -37.29% aggregate profit margin

### Central Region

Central had an average discount of approximately 24%, the highest among the regions analyzed.

Central high-discount transactions generated approximately:

- $129,193 in sales
- -$52,444 in profit
- -40.59% aggregate profit margin

### Product-Level Risk

High-discount losses were concentrated in selected sub-categories, particularly Binders, Appliances, and Furnishings.

Central Binders with extreme discounts generated approximately $21,955 in aggregate losses.

### Statistical Analysis

A simple regression of Profit on Discount produced a discount coefficient of approximately -246.70 with p < 0.001.

A multiple regression using Discount, Sales, and Quantity increased R² from 4.8% to approximately 27.5%.

The discount coefficient remained strongly negative after accounting for the additional variables.

HC3 robust standard errors confirmed that the discount coefficient remained statistically significant.

### Forecasting

Holt-Winters exponential smoothing incorporating trend and 12-month seasonality substantially outperformed a naive last-value forecast on the held-out 12-month test period.

| Model | MAE | RMSE |
|---|---:|---:|
| Naive Baseline | $38,863.69 | $43,964.20 |
| Holt-Winters | $11,384.72 | $12,865.34 |

The Holt-Winters model reduced MAE by approximately 70.7% versus the naive baseline.

---

## Business Recommendations

1. Review extreme discounting practices, particularly in the Central region.
2. Investigate highly discounted Binders, Appliances, and Furnishings.
3. Monitor profit margin alongside sales volume rather than relying on sales alone.
4. Review unusually large discount levels as part of pricing or clearance policies.
5. Use seasonal sales forecasts to support sales, inventory, and planning decisions.

---

## Power BI Dashboard

The Power BI report contains:

1. Executive Overview
2. Discount & Profitability
3. Product Analysis
4. Sales Forecast

---

## Project Structure

```text
sales-operations-analytics/
├── data/
├── python/
├── sql/
├── powerbi/
├── README.md
├── requirements.txt
└── .gitignore
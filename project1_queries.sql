-- ============================================================
-- SUPERSTORE SALES ANALYTICS
-- ============================================================


-- ============================================================
-- 1. MONTHLY SALES & PROFIT KPIs
-- ============================================================

SELECT
    strftime('%Y-%m', "Order Date") AS Month,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin_Pct
FROM sales
GROUP BY strftime('%Y-%m', "Order Date")
ORDER BY Month;


-- ============================================================
-- 2. REGIONAL PROFITABILITY
-- ============================================================

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin_Pct
FROM sales
GROUP BY Region
ORDER BY Total_Sales DESC;


-- ============================================================
-- 3. LOSS-MAKING PRODUCTS
-- ============================================================

SELECT
    "Product ID",
    "Product Name",
    "Sub-Category",
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    SUM(Quantity) AS Total_Quantity
FROM sales
GROUP BY
    "Product ID",
    "Product Name",
    "Sub-Category"
HAVING SUM(Profit) < 0
ORDER BY Total_Profit ASC;


-- ============================================================
-- 4. DISCOUNT IMPACT ON PROFITABILITY
-- ============================================================

SELECT
    Discount,
    COUNT(*) AS Transactions,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,
    ROUND(
        SUM(Profit) * 100.0 / SUM(Sales),
        2
    ) AS Profit_Margin_Pct
FROM sales
GROUP BY Discount
ORDER BY Discount;


-- ============================================================
-- 5. CENTRAL REGION: HIGH-DISCOUNT IMPACT
-- ============================================================

SELECT
    Region,
    ROUND(SUM(Sales), 2) AS Total_Sales,
    ROUND(SUM(Profit), 2) AS Total_Profit,

    ROUND(
        SUM(
            CASE
                WHEN Discount >= 0.30 THEN Profit
                ELSE 0
            END
        ),
        2
    ) AS High_Discount_Profit,

    ROUND(
        SUM(
            CASE
                WHEN Discount >= 0.30 THEN Sales
                ELSE 0
            END
        ),
        2
    ) AS High_Discount_Sales

FROM sales
WHERE Region = 'Central'
GROUP BY Region;
-- SQL Data Analysis — Project 3
-- Dataset: Cleaned_Dataset_for_Data_Analytics.xlsx (table: orders)

-- Q1_basic_select
SELECT OrderID, Date, Product, Quantity, UnitPrice, TotalPrice
FROM orders
LIMIT 10;

-- Q2_where_filter
SELECT OrderID, Date, CustomerID, Product, TotalPrice, PaymentMethod
FROM orders
WHERE TotalPrice > 2000
  AND PaymentMethod = 'Credit Card'
ORDER BY TotalPrice DESC
LIMIT 10;

-- Q3_order_by
SELECT OrderID, Product, Date, TotalPrice
FROM orders
ORDER BY TotalPrice DESC
LIMIT 10;

-- Q4_count_orders_total
SELECT
  COUNT(*) AS TotalOrders,
  ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
  ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM orders;

-- Q5_revenue_by_product
SELECT
  Product,
  COUNT(*) AS OrdersCount,
  SUM(Quantity) AS UnitsSold,
  ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
  ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM orders
GROUP BY Product
ORDER BY TotalRevenue DESC;

-- Q6_orders_by_status
SELECT
  OrderStatus,
  COUNT(*) AS OrderCount,
  ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
  ROUND(100.0 * COUNT(*) / (SELECT COUNT(*) FROM orders), 2) AS PctOfOrders
FROM orders
GROUP BY OrderStatus
ORDER BY OrderCount DESC;

-- Q7_revenue_by_payment
SELECT
  PaymentMethod,
  COUNT(*) AS OrderCount,
  ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
  ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM orders
GROUP BY PaymentMethod
ORDER BY TotalRevenue DESC;

-- Q8_referral_source_pct
SELECT
  ReferralSource,
  COUNT(*) AS OrderCount,
  ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
  ROUND(100.0 * SUM(TotalPrice) / (SELECT SUM(TotalPrice) FROM orders), 2) AS PctOfRevenue
FROM orders
GROUP BY ReferralSource
ORDER BY TotalRevenue DESC;

-- Q9_top_customers_having
SELECT
  CustomerID,
  COUNT(*) AS OrdersPlaced,
  ROUND(SUM(TotalPrice), 2) AS TotalSpent
FROM orders
GROUP BY CustomerID
HAVING COUNT(*) >= 2
ORDER BY TotalSpent DESC
LIMIT 10;

-- Q10_coupon_analysis
SELECT
  CouponCode,
  COUNT(*) AS OrdersCount,
  ROUND(AVG(TotalPrice), 2) AS AvgOrderValue,
  ROUND(SUM(TotalPrice), 2) AS TotalRevenue
FROM orders
GROUP BY CouponCode
ORDER BY OrdersCount DESC;

-- Q11_monthly_trend
SELECT
  strftime('%Y-%m', Date) AS OrderMonth,
  COUNT(*) AS OrdersCount,
  ROUND(SUM(TotalPrice), 2) AS TotalRevenue
FROM orders
GROUP BY OrderMonth
ORDER BY OrderMonth;

-- Q12_high_value_products_having
SELECT
  Product,
  SUM(Quantity) AS TotalUnitsSold,
  ROUND(SUM(TotalPrice), 2) AS TotalRevenue,
  ROUND(AVG(UnitPrice), 2) AS AvgUnitPrice
FROM orders
GROUP BY Product
HAVING SUM(TotalPrice) > 50000
ORDER BY TotalRevenue DESC;

-- Q13_cancelled_returned_analysis
SELECT
  Product,
  OrderStatus,
  COUNT(*) AS OrderCount,
  ROUND(SUM(TotalPrice), 2) AS RevenueImpact
FROM orders
WHERE OrderStatus IN ('Cancelled', 'Returned')
GROUP BY Product, OrderStatus
ORDER BY RevenueImpact DESC
LIMIT 10;

-- Q14_referral_by_product_topcombo
SELECT
  ReferralSource,
  Product,
  COUNT(*) AS OrderCount,
  ROUND(SUM(TotalPrice), 2) AS TotalRevenue
FROM orders
GROUP BY ReferralSource, Product
HAVING COUNT(*) >= 5
ORDER BY TotalRevenue DESC
LIMIT 10;


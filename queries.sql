-- View first 10 rows from each table
SELECT * FROM customers LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM markets LIMIT 10;
SELECT * FROM transactions LIMIT 10;

-- Total company sales
SELECT 
    SUM(sales_amount) AS total_revenue
FROM transactions;

-- Year-wise sales
SELECT 
    d.year,
    SUM(t.sales_amount) AS total_sales
FROM transactions t
JOIN date_dim d
    ON t.order_date = d.date
GROUP BY d.year
ORDER BY d.year;

-- Best customers
SELECT 
    c.custmer_name,
    SUM(t.sales_amount) AS total_sales
FROM transactions t
JOIN customers c
    ON t.customer_code = c.customer_code
GROUP BY c.custmer_name
ORDER BY total_sales DESC
LIMIT 5;

-- Sales per market
SELECT 
    m.markets_name,
    SUM(t.sales_amount) AS total_sales
FROM transactions t
JOIN markets m
    ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY total_sales DESC;

-- Sales per market
SELECT 
    m.markets_name,
    SUM(t.sales_amount) AS total_sales
FROM transactions t
JOIN markets m
    ON t.market_code = m.markets_code
GROUP BY m.markets_name
ORDER BY total_sales DESC;
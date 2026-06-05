CREATE DATABASE crm_sales_db;
USE crm_sales_db;

CREATE TABLE accounts (
    account VARCHAR(100) PRIMARY KEY,
    sector VARCHAR(50),
    year_established INT,
    revenue DECIMAL(12,2),
    employees INT,
    office_location VARCHAR(100),
    subsidiary_of VARCHAR(100)
);
select * from accounts;
CREATE TABLE products (
    product VARCHAR(100) PRIMARY KEY,
    series VARCHAR(50),
    sales_price DECIMAL(12,2)
);
select * from products;

CREATE TABLE sales_teams (
    sales_agent VARCHAR(100) PRIMARY KEY,
    manager VARCHAR(100),
    regional_office VARCHAR(50)
);
select * from sales_teams;

CREATE TABLE sales_pipeline (
    opportunity_id VARCHAR(20) PRIMARY KEY,

    sales_agent VARCHAR(100),
    product VARCHAR(100),
    account VARCHAR(100),

    deal_stage VARCHAR(50),

    engage_date DATE,
    close_date DATE,

    close_value DECIMAL(12,2),

    CONSTRAINT fk_salesagent
        FOREIGN KEY (sales_agent)
        REFERENCES sales_teams(sales_agent),

    CONSTRAINT fk_product
        FOREIGN KEY (product)
        REFERENCES products(product),

    CONSTRAINT fk_account
        FOREIGN KEY (account)
        REFERENCES accounts(account)
);
select * from sales_pipeline;
SELECT DISTINCT product
FROM sales_pipeline;
SELECT DISTINCT product
FROM products;

UPDATE sales_pipeline
SET product = 'GTX Pro'
WHERE product = 'GTXPro';
SELECT DISTINCT product
FROM sales_pipeline;
-- Checking Null VALUES
SELECT *
FROM sales_pipeline
WHERE account IS NULL
   OR product IS NULL
   OR sales_agent IS NULL;
-- Checking Missing Accounts
SELECT DISTINCT sp.account
FROM sales_pipeline sp
LEFT JOIN accounts a
ON sp.account = a.account
WHERE a.account IS NULL;
-- Checking Missing Products
SELECT DISTINCT sp.product
FROM sales_pipeline sp
LEFT JOIN products p
ON sp.product = p.product
WHERE p.product IS NULL;
-- Checking missing sales agents
SELECT DISTINCT sp.sales_agent
FROM sales_pipeline sp
LEFT JOIN sales_teams st
ON sp.sales_agent = st.sales_agent
WHERE st.sales_agent IS NULL;

 


SELECT DISTINCT deal_stage
FROM sales_pipeline;

-- Analysis
-- Q1. Overall sales Performance
SELECT COUNT(*) AS Total_Deals, SUM(close_value) AS Total_Revenue
FROM sales_pipeline WHERE deal_stage = 'Won';
-- Q2. Won vs Lost Deals
SELECT deal_stage, COUNT(*) AS Total_Deals
FROM sales_pipeline GROUP BY deal_stage;
-- Q3. Revenue by Product
SELECT product, SUM(close_value) AS Revenue
FROM sales_pipeline
WHERE deal_stage='Won'
GROUP BY product
ORDER BY Revenue DESC;
-- Q4. Top 10 customers
SELECT account, SUM(close_value) AS Revenue
FROM sales_pipeline
WHERE deal_stage='Won'
GROUP BY account
ORDER BY Revenue DESC
LIMIT 10;
-- Q5. Revenue by Region
SELECT st.regional_office,SUM(sp.close_value) AS Revenue
FROM sales_pipeline sp
JOIN sales_teams st
ON sp.sales_agent = st.sales_agent
WHERE sp.deal_stage='Won'
GROUP BY st.regional_office
ORDER BY Revenue DESC;

-- Q6.Manager Performance
SELECT st.manager, SUM(sp.close_value) As Revenue
FROM sales_pipeline sp
JOIN sales_teams st
ON sp.sales_agent = st.sales_agent
WHERE sp.deal_stage='Won'
GROUP BY st.manager
ORDER BY Revenue DESC;
-- Q7. Which Sales agents generatedd the highest revenue?
SELECT sales_agent, SUM(close_value) AS Revenue
FROM sales_pipeline
WHERE deal_stage = 'Won'
GROUP BY sales_agent
ORDER BY Revenue DESC;
-- Q8.Rank sales agents based on revenue generated
SELECT sales_agent,SUM(close_value) AS Revenue,
    RANK() OVER(ORDER BY SUM(close_value) DESC) AS Agent_Rank
FROM sales_pipeline
WHERE deal_stage = 'Won'
GROUP BY sales_agent;
-- Q9. What is the avearage deal value for each product
SELECT product,ROUND(AVG(close_value),2) AS Avg_Deal_Value
FROM sales_pipeline
WHERE deal_stage = 'Won'
GROUP BY product
ORDER BY Avg_Deal_Value DESC;
-- 10.Which accounts generated more than $1,000,000 in revenue?
SELECT account, SUM(close_value) AS Revenue
FROM sales_pipeline
WHERE deal_stage = 'Won'
GROUP BY account
HAVING SUM(close_value) > 1000000
ORDER BY Revenue DESC;






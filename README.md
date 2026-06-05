# CRM Sales Pipeline Analysis Using SQL

## Project Overview

This project analyzes CRM sales pipeline data to evaluate sales performance, revenue generation, customer value, product performance, and regional sales effectiveness.

The analysis was performed using SQL by integrating multiple related tables including Accounts, Products, Sales Teams, and Sales Pipeline data.

## Problem Statement

A technology company wants to understand its sales performance and identify key revenue drivers.

The objectives are to:

* Analyze revenue generated from won deals.
* Identify top-performing products and customers.
* Evaluate sales team and manager performance.
* Compare regional revenue contributions.
* Rank sales agents based on revenue generation.
* Generate business insights from CRM sales data.

## Dataset

The project uses four relational tables:

### Accounts

Customer account information.

### Products

Product catalog and pricing details.

### Sales Teams

Sales agents, managers, and regional office information.

### Sales Pipeline

Opportunity-level sales transactions and deal outcomes.

## SQL Concepts Used

* SELECT
* WHERE
* GROUP BY
* ORDER BY
* HAVING
* Aggregate Functions (SUM, COUNT, AVG)
* INNER JOIN
* Window Functions (RANK)

## Business Questions Solved

1. What is the total revenue generated from won deals?
2. How many deals were won and lost?
3. Which products generated the highest revenue?
4. Who are the top customers by revenue?
5. Which regional office generated the highest revenue?
6. How did each manager perform?
7. Which sales agents generated the highest revenue?
8. How can sales agents be ranked based on revenue?
9. What is the average deal value for each product?
10. Which accounts generated more than $1M in revenue?

## Project Structure

CRM-Sales-Pipeline-Analysis/
│
├── Data/
│   ├── accounts.csv
│   ├── products.csv
│   ├── sales_pipeline.csv
│   └── sales_teams.csv
│
├── SQL Queries/
│   └── crm_sales_analysis.sql
│
│
└── README.md

## Key Insights

* Identified top-performing products and customers.
* Evaluated regional and managerial sales performance.
* Ranked sales agents based on revenue contribution.
* Analyzed deal conversion outcomes using won and lost opportunities.

## Tools Used

* MySQL
* MySQL Workbench
* SQL
* Analysis 

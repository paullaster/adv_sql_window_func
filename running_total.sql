/*
create a running total of standard_amt_usd
 (in the orders table) over order,
  date truncate occurred_at by year
   and partition by that same year-truncated
    occurred_at variable. 
    Your final table should have three columns:
     One with the amount
  being added for each row, 
  one for the truncated date, 
  and a final column with the running total within each year.
*/
SELECT
DATE_TRUNC('year', occurred_at) occurred_at,
standard_amt_usd,
SUM(standard_amt_usd) 
OVER(
PARTITION BY  DATE_TRUNC('year', occurred_at)
ORDER BY occurred_at) running_total
FROM orders
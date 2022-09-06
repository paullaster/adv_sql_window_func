/*
determine how the current order's
 total revenue ("total" meaning
from sales of all types of paper) 
compares to the next order's total revenue.
*/
SELECT 
occurred_at,
total_usd_sum,
 LEAD(total_usd_sum) OVER (ORDER BY total_usd_sum) AS lead,
 LEAD(total_usd_sum) OVER (ORDER BY total_usd_sum) - total_usd_sum AS lead_difference
FROM (
SELECT occurred_at,
       SUM(total_amt_usd) AS total_usd_sum
  FROM orders 
 GROUP BY 1
) sub
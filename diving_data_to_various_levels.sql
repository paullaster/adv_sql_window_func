/*
Use the NTILE functionality 
to divide the accounts into 4 levels 
in terms of the amount of standard_qty
 for their orders. Your resulting table 
 should have the account_id, 
 the occurred_at time for each order,
the total amount of standard_qty 
paper purchased, and one of four 
levels in a standard_quartile column.
*/
SELECT 
account_id,
occurred_at,
standard_qty,
NTILE(4) OVER(PARTITION BY account_id ORDER BY standard_qty) standard_quartile
FROM orders

/*
Use the NTILE functionality to divide
 the accounts into two levels in terms 
 of the amount of gloss_qty for their orders. 
 Your resulting table should have the account_id, 
 the occurred_at time for each order, the total 
 amount of gloss_qty paper purchased, 
 and one of two levels in a gloss_half column
*/
SELECT 
account_id,
occurred_at,
gloss_qty,
NTILE(2) OVER(PARTITION BY account_id ORDER BY standard_qty) gloss_half
FROM orders
/*Description
Given a posts table
 that contains a created_at timestamp 
 column write a query that returns 
 date (without time component), a 
 number of posts for a given 
 date and a running (cumulative)
total number of posts up until a given date. 
The resulting set should be ordered 
chronologically by date.
*/
/*
CTE transform data and count the post per date
*/
WITH t1 AS (SELECT
  DATE(DATE_TRUNC('day',created_at)) AS date,
  CAST(COUNT(DATE(DATE_TRUNC('day',created_at))) AS INTEGER) AS count
FROM posts
GROUP BY 1)
/*
SELECTING FROM CTE
*/      
SELECT
  date,
  count,
  SUM(count) 
  OVER(ORDER BY date)total
FROM t1
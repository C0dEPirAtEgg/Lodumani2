SELECT
    v.customer_id,
    COUNT(*) AS count_no_trans
FROM visits AS v
LEFT JOIN transactions AS t
ON v.visit_id = t.visit_id
WHERE
    1=1
    AND transaction_id IS NULL
GROUP BY
    v.customer_id

-- SELECT  customer_id, count(*) AS count_no_trans FROM Visits 
-- WHERE visit_id NOT IN (SELECT visit_id FROM Transactions ) 
-- GROUP BY customer_id
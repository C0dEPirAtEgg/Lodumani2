-- SELECT
--     p.product_id,
--     ROUND(SUM(price * units) / SUM(units),2)AS average_price
-- FROM prices AS p
-- LEFT JOIN unitssold AS u
-- ON 1=1
-- AND p.product_id = u.product_id
-- AND u.purchase_date BETWEEN p.start_date AND p.end_date
-- GROUP BY
--     p.product_id

SELECT
    p.product_id,
    ROUND(IFNULL(sum(price * units) / sum(units),0),2) AS average_price
FROM prices AS p
LEFT JOIN unitssold AS u
ON 1=1
AND p.product_id = u.product_id
AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY
    p.product_id
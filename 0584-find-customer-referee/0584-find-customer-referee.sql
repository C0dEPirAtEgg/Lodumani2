SELECT
    name
FROM customer
WHERE
    1=1
    AND (referee_id != 2)
    OR (referee_id IS NULL)

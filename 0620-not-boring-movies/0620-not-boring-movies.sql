SELECT
    *
FROM cinema
WHERE
    1=1
    AND description != 'boring'
    AND (id % 2) != 0
ORDER BY
    rating DESC

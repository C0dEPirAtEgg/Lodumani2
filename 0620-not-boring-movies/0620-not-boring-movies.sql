SELECT
    *
FROM cinema
WHERE
    1=1
    AND description != 'boring'
    -- AND (id % 2) != 0
    AND MOD(id,2) = 1
ORDER BY
    rating DESC

WITH cte AS (
    SELECT
        email,
        COUNT(*) AS cnt
    FROM person
    WHERE
        1=1
        AND email IS NOT NULL
    GROUP BY
        email
)
SELECT
    email
FROM cte
WHERE
    1=1
    AND cnt >= 2

-- SELECT
--     email,
--     # COUNT(id) AS cnt
-- FROM person
-- GROUP BY
--     email
-- HAVING
--     COUNT(id) > 1

-- email | count(id)
-- a@b.com     2
-- c@b.com     1
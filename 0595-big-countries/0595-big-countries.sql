SELECT
    name,
    population,
    area
FROM world
WHERE
    1=1
    AND (area >= 3000000)
    OR (population >= 25000000)

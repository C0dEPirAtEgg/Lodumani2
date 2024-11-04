SELECT
    unique_id,
    name
FROM employees AS ep
LEFT JOIN employeeuni AS eu
ON ep.id = eu.id


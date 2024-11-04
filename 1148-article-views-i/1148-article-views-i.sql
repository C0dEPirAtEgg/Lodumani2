SELECT
    DISTINCT author_id AS id
FROM views
WHERE
    1=1
    AND author_id = viewer_id
ORDER BY
    id


-- SELECT id from (SELECT author_id AS id FROM Views 
-- where author_id = viewer_id 
-- ORDER BY id)a
-- GROUP BY id
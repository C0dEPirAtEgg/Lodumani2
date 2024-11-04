SELECT
    tweet_id
FROM tweets
WHERE
    1=1
    AND CHAR_LENGTH(content) > 15
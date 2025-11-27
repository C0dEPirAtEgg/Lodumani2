# 양극화된 의견(서로 다른 독자로부터 매우 높은 평점과 매우 낮은 평점을 동시에 받은 책)을 찾는 솔루션을 작성
# 평점이 4이상인 책이 하나 이상 있고 2이하인 책이 하나 이상 있는 경우 해당 책은 양극화된 의견으로 간주
# 최소 5회이상 독서 세션이 있는 책만 고려
# 평점 분포 (최고 평점 - 최저 평점)으로 계산하세요.
# 극단적 평점()의 수를 전체 세션으로 나누어 극단화 점수를 계산하세요.

WITH book_rating AS (
    SELECT
        book_id,
        MAX(session_rating) - MIN(session_rating) AS rating_spread,
        (SUM(IF(session_rating >= 4 ,1,0)) + SUM(IF(session_rating <= 2, 1,0))) / COUNT(session_id) AS polarization_score
    FROM reading_sessions
    GROUP BY
        book_id
    HAVING
        COUNT(session_id) >= 5
        AND SUM(IF(session_rating >= 4 ,1,0)) >= 1
        AND SUM(IF(session_rating <= 2, 1,0)) >= 1
)
SELECT
    b1.*,
    b2.rating_spread,
    ROUND(b2.polarization_score,2) AS polarization_score
FROM books AS b1
INNER JOIN book_rating AS b2
ON b1.book_id = b2.book_id
WHERE
    1=1
    AND polarization_score
ORDER BY
    polarization_score DESC,
    title DESC

-- | book_id | title                | author          | genre           | pages | rating_spread | polarization_score |
-- | ------- | -------------------- | --------------- | --------------- | ----- | ------------- | ------------------ |
-- | 18      | Whispers in the Dark | Mark Allen      | Thriller        | 233   | 4             | 1                  |
-- | 3       | Thunder Mountain     | Betty Wright    | Adventure       | 194   | 2             | 1                  |
-- | 4       | The Wild Hunt        | Patricia Harris | Fiction         | 165   | 3             | 1                  |
-- | 2       | The Golden Path      | Lisa Taylor     | Romance         | 527   | 3             | 1                  |
-- | 6       | Starlight Express    | John Smith      | Adventure       | 251   | 3             | 1                  |
-- | 5       | Lost Horizon         | Robert Anderson | Science Fiction | 408   | 4             | 1                  |
-- | 1       | Digital Dreams       | John Smith      | Comedy          | 290   | 4             | 1                  |
-- | 16      | Desert Rose          | Elizabeth White | Drama           | 248   | 4             | 1                  |
-- | 15      | Crystal Palace       | Mary Garcia     | Horror          | 466   | 3             | 1                  |


-- | book_id | title                | author          | genre           | pages | rating_spread | polarization_score |
-- | ------- | -------------------- | --------------- | --------------- | ----- | ------------- | ------------------ |
-- | 2       | The Golden Path      | Lisa Taylor     | Romance         | 527   | 3             | 1                  |
-- | 6       | Starlight Express    | John Smith      | Adventure       | 251   | 3             | 1                  |
-- | 5       | Lost Horizon         | Robert Anderson | Science Fiction | 408   | 4             | 1                  |
-- | 1       | Digital Dreams       | John Smith      | Comedy          | 290   | 4             | 1                  |
-- | 4       | The Wild Hunt        | Patricia Harris | Fiction         | 165   | 3             | 0.9                |
-- | 18      | Whispers in the Dark | Mark Allen      | Thriller        | 233   | 4             | 0.86               |
-- | 3       | Thunder Mountain     | Betty Wright    | Adventure       | 194   | 2             | 0.8                |
-- | 16      | Desert Rose          | Elizabeth White | Drama           | 248   | 4             | 0.8                |
-- | 15      | Crystal Palace       | Mary Garcia     | Horror          | 466   | 3             | 0.6                |
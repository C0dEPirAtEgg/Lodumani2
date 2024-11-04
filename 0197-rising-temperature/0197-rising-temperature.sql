# Write your MySQL query statement below
SELECT
    w1.id
FROM weather AS w1, weather AS w2 # cross join
WHERE 
    1=1
    AND DATEDIFF(w1.recorddate, w2.recorddate) = 1 # DATEDIFF(종료일, 시작일) = 1
    AND w1.temperature > w2.temperature
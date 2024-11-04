# 쿼리를 작성하는 목표, 확인할 지표 : bonus가 1000 보다 적은 사람들을 출력하시오
# 쿼리 계산 방법 : employee 테이블과 bonus 테이블을 조인후 bonus가 1000원 보다 작은 사람의 이름과 보너스 출력
# 데이터의 기간 : X
# 사용할 테이블 : employee, bonus
# Join KEY : empid
# 데이터 특징 : x


SELECT
    e.name,
    b.bonus
FROM employee AS e
LEFT JOIN bonus AS b
ON e.empid = b.empid
WHERE
    1=1
    AND (b.bonus < 1000)
    OR (b.bonus IS NULL)

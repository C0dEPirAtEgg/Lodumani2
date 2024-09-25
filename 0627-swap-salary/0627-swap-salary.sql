UPDATE salary
SET sex = CASE WHEN sex = 'f' THEN 'm' ELSE 'f'
END

/*
UPDATE Salary
SET sex = CASE
    WHEN sex ='m' then 'f'
    WHEN sex = 'f' then 'm'
END;
*/
-- 쿼리 6-1
SELECT 'A' || 'B'
  FROM dual;

  
-- 쿼리 6-2
SELECT ROUND( 565.545, -1 ) first
      ,ROUND( 565.545, -2 ) second
      ,ROUND( 565.545, -3 ) third
  FROM DUAL;

-- 쿼리 6-3
SELECT SUBSTR( 'ABCDEFG', 1, 3 )   first
      ,SUBSTR( 'ABCDEFG', 0, 3 )   second
      ,SUBSTR( 'ABCDEFG', 1 )      third
      ,SUBSTR( 'ABCDEFG', -2 )     fourth
      ,SUBSTR( 'ABCDEFG', -2, 1 )  fifth
      ,SUBSTR( 'ABCDEFG', 2, -1 )  sixth
  FROM DUAL ;

-- 쿼리 6-4
SELECT INSTR( 'ABABAB', 'A' )       first
      ,INSTR( 'ABABAB', 'A', 2 )    second
      ,INSTR( 'ABABAB', 'A', 2, 1 ) third
      ,INSTR( 'ABABAB', 'A', 2, 2 ) fourth
  FROM DUAL ;

-- 쿼리 6-5
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH24:MI:SS')
  FROM DUAL;
  
-- 쿼리 6-6
INSERT INTO emp03 ( emp_id, emp_name, gender, age, hire_date )
VALUES (1, '홍길동', '남성', 33, TO_DATE('2018-01-01', 'YYYY-MM-DD'));
  
-- 쿼리 6-7
SELECT NVL( NULL, 'N/A' )
      ,NVL2( 1, 2, 3 ) 
      ,COALESCE( NULL, NULL, 5, 4, NULL )
      ,NULLIF( 'NULL', 'null' ) 
  FROM DUAL; 
 

-- 쿼리 6-8
SELECT emp_name
      ,age
      ,CASE WHEN age BETWEEN 0  AND 19 THEN '10대'
            WHEN age BETWEEN 20 AND 29 THEN '20대'
            WHEN age BETWEEN 30 AND 39 THEN '30대'
            WHEN age BETWEEN 40 AND 49 THEN '40대'
            WHEN age BETWEEN 50 AND 59 THEN '50대'
            ELSE '60대 이상'
       END ages
  FROM EMP03;

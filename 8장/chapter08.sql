-- 쿼리 8-1
CREATE TABLE emp08
(
  emp_id2    NUMBER        NOT NULL,
  emp_name2  VARCHAR2(100) NOT NULL,
  gender     VARCHAR2(10),
  age        NUMBER,
  hire_date  DATE,
  etc        VARCHAR2(300),
  CONSTRAINT emp08_pk PRIMARY KEY (emp_id2)
);

-- 쿼리 8-2
INSERT INTO emp08 ( emp_id2, emp_name2, gender, age, hire_date )
VALUES (1, '선덕여왕', '여성', 23, TO_DATE('2018-02-01', 'YYYY-MM-DD'));

INSERT INTO emp08 ( emp_id2, emp_name2, gender, age, hire_date )
VALUES (2, '허난설헌', '여성', 33, TO_DATE('2018-02-01', 'YYYY-MM-DD'));

INSERT INTO emp08 ( emp_id2, emp_name2, gender, age, hire_date )
VALUES (3, '김만덕', '여성', 43, TO_DATE('2018-02-01', 'YYYY-MM-DD'));

INSERT INTO emp08 ( emp_id2, emp_name2, gender, age, hire_date )
VALUES (4, '장희빈', '여성', 35, TO_DATE('2018-02-01', 'YYYY-MM-DD'));

INSERT INTO emp08 ( emp_id2, emp_name2, gender, age, hire_date )
VALUES (5, '신사임당', '여성', 45, TO_DATE('2018-02-01', 'YYYY-MM-DD'));

COMMIT;

-- 쿼리 8-3
SELECT emp_id, emp_name, gender, age
  FROM emp03
 UNION ALL 
SELECT emp_id2, emp_name2, gender, age
  FROM emp08;

-- 쿼리 8-4
SELECT emp_id, emp_name, gender, age
  FROM emp03
 UNION ALL
SELECT emp_id2, emp_name2, gender
  FROM emp08;

-- 쿼리 8-5
SELECT emp_id, emp_name, gender, age
  FROM emp03
 UNION ALL
SELECT emp_id2, emp_name2, gender, 'A'
  FROM emp08;


-- 쿼리 8-6
SELECT emp_id, emp_name, gender, age
  FROM emp03
 UNION ALL
SELECT emp_id2, emp_name2, gender, age
  FROM emp08
 ORDER BY emp_id DESC;


-- 쿼리 8-7
SELECT emp_name
  FROM emp03
 UNION ALL
SELECT emp_name2
  FROM emp08 
 ORDER BY 1;

-- 쿼리 8-8
SELECT emp_name
  FROM emp03
 UNION
SELECT emp_name2
  FROM emp08
 ORDER BY 1;

-- 쿼리 8-9
SELECT emp_name, gender, age
  FROM emp03
 UNION
SELECT emp_name2, gender, age 
  FROM emp08
 ORDER BY 1;


-- 쿼리 8-10
SELECT emp_name
  FROM emp03
INTERSECT
SELECT emp_name2
  FROM emp08
 ORDER BY 1;

-- 쿼리 8-11
SELECT emp_name, gender, age
  FROM emp03
INTERSECT
SELECT emp_name2, gender, age 
  FROM emp08
 ORDER BY 1;

-- 쿼리 8-12
SELECT emp_name
  FROM emp03
 MINUS
SELECT emp_name2
  FROM emp08
 ORDER BY 1;

-- 쿼리 8-13
SELECT emp_name2
  FROM emp08
 MINUS
SELECT emp_name
  FROM emp03
 ORDER BY 1;



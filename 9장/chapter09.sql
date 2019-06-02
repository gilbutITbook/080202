-- 쿼리 9-1
CREATE TABLE emp_master
(
  emp_id     NUMBER        NOT NULL, --사원번호
  emp_name   VARCHAR2(100) NOT NULL, --사원명
  gender     VARCHAR2(10),           --성별
  age        NUMBER,                 --나이
  hire_date  DATE,                   --입사일자
  dept_id    NUMBER,                 --부서아이디
  address_id NUMBER,                 --주소아이디
  CONSTRAINT emp_master_pk PRIMARY KEY (emp_id)
);

CREATE TABLE dept_master (
  dept_id    NUMBER NOT NULL,         --부서아이디
  dept_name  VARCHAR2(50),            --부서 명
  use_yn     VARCHAR2(2) DEFAULT 'Y', --사용여부
  dept_desc  VARCHAR2(100),           --부서설명
  CONSTRAINT dept_master_pk PRIMARY KEY (dept_id)
);


CREATE TABLE address_master (
  address_id   NUMBER NOT NULL,       --주소아이디 
  city         VARCHAR2(100),         --도시 명 
  gu           VARCHAR2(50),          --구 명
  address_name VARCHAR2(100),         --나머지 주소
  CONSTRAINT address_master_pk PRIMARY KEY (address_id)
);

  

-- 쿼리 9-2
INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (1, '김유신', '남성', 56, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1, 1);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (2, '신사임당', '여성', 34, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1, 2);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (3, '홍길동', '남성', 45, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 3, 2);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (4, '강감찬', '남성', 23, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 2, 3);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (5, '세종대왕', '남성', 45, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 4, 4);


INSERT INTO dept_master ( dept_id, dept_name )
VALUES (1, '회계팀');

INSERT INTO dept_master ( dept_id, dept_name )
VALUES (2, '경영팀');

INSERT INTO dept_master ( dept_id, dept_name )
VALUES (3, '전산팀');

INSERT INTO dept_master ( dept_id, dept_name )
VALUES (4, '마케팅팀');

INSERT INTO address_master ( address_id, city, gu, address_name )
VALUES (1, '서울특별시', '중구', '새문안로 12');

INSERT INTO address_master ( address_id, city, gu, address_name )
VALUES (2, '서울특별시', '서대문구', '연희로 15길');

INSERT INTO address_master ( address_id, city, gu, address_name )
VALUES (3, '서울특별시', '영등포구', '여의대로 99');

INSERT INTO address_master ( address_id, city, gu, address_name )
VALUES (4, '서울특별시', '강남구', '테헤란로 33');


COMMIT;


-- 쿼리 9-3
SELECT *
  FROM dept_master;

-- 쿼리 9-4
SELECT a.emp_id, a.emp_name, a.gender, a.age, a.dept_id,
       b.dept_id, b.dept_name, b.use_yn
  FROM emp_master a
      ,dept_master b
 WHERE a.dept_id = b.dept_id
 ORDER BY a.emp_id;
 
-- 쿼리 9-5
SELECT a.emp_id, a.emp_name, a.gender, a.age, a.dept_id,
       b.dept_id, b.dept_name, b.use_yn
  FROM emp_master a
 INNER JOIN dept_master b
    ON a.dept_id = b.dept_id
 ORDER BY a.emp_id;
 
 -- 쿼리 9-6
 -- 기본 구문
SELECT a.emp_id, a.emp_name, a.gender, a.age, a.dept_id,
       b.dept_id, b.dept_name, b.use_yn
  FROM emp_master a
      ,dept_master b
 WHERE a.dept_id = b.dept_id
   AND a.gender = '남성'
 ORDER BY a.emp_id;
 
 -- ANSI 구문
SELECT a.emp_id, a.emp_name, a.gender, a.age, a.dept_id,
       b.dept_id, b.dept_name, b.use_yn
  FROM emp_master a
 INNER JOIN dept_master b
    ON a.dept_id = b.dept_id
 WHERE a.gender = '남성'
 ORDER BY a.emp_id;
 
-- 쿼리 9-7
 -- 기본 구문
SELECT a.emp_id, a.emp_name, a.gender, a.age, 
       b.dept_id, b.dept_name, b.use_yn,
       c.address_id, c.city, c.gu, c.address_name
  FROM emp_master a
      ,dept_master b
      ,address_master c
 WHERE a.dept_id    = b.dept_id
   AND a.address_id = c.address_id
   AND a.gender     = '남성'
 ORDER BY a.emp_id;
 
  -- ANSI 구문
SELECT a.emp_id, a.emp_name, a.gender, a.age, 
       b.dept_id, b.dept_name, b.use_yn,
       c.address_id, c.city, c.gu, c.address_name
  FROM emp_master a
 INNER JOIN dept_master b
    ON a.dept_id = b.dept_id
 INNER JOIN address_master c
    ON a.address_id = c.address_id
 WHERE a.gender = '남성'
 ORDER BY a.emp_id; 
 
 
 -- 쿼리 9-8
INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (6, '왕건', '남성', 35, TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL, 4);

COMMIT;

 -- 쿼리 9-9
SELECT a.emp_id, a.emp_name, a.gender, a.age, a.dept_id,
       b.dept_id, b.dept_name, b.use_yn
  FROM emp_master a
      ,dept_master b
 WHERE a.dept_id = b.dept_id(+)
 ORDER BY a.emp_id;


-- 쿼리 9-10
SELECT a.emp_id, a.emp_name, a.gender, a.age, a.dept_id,
       b.dept_id, b.dept_name, b.use_yn
  FROM emp_master a
  LEFT JOIN dept_master b
    ON a.dept_id = b.dept_id
 ORDER BY a.emp_id;
 
 
-- 쿼리 9-11
INSERT INTO dept_master ( dept_id, dept_name )
VALUES (5, 'IT팀');

COMMIT;

-- 쿼리 9-12
-- 오라클 기본 구문
SELECT a.emp_id, a.emp_name, a.gender, a.age, a.dept_id,
       b.dept_id, b.dept_name, b.use_yn
  FROM emp_master a
      ,dept_master b
 WHERE a.dept_id(+) = b.dept_id
 ORDER BY a.emp_id;
 
-- ANSI 구문
SELECT a.emp_id, a.emp_name, a.gender, a.age, a.dept_id,
       b.dept_id, b.dept_name, b.use_yn
  FROM emp_master a
 RIGHT JOIN dept_master b
    ON a.dept_id = b.dept_id
 ORDER BY a.emp_id;
 
-- 쿼리 9-13
SELECT a.emp_id, a.emp_name, a.gender, a.age, a.dept_id,
       b.dept_id, b.dept_name, b.use_yn
  FROM emp_master a
  FULL OUTER JOIN dept_master b
    ON a.dept_id = b.dept_id
 ORDER BY a.emp_id;

 -- 쿼리 9-14 
SELECT a.emp_id, a.emp_name, a.gender, a.age, a.dept_id,
       b.dept_id, b.dept_name, b.use_yn
  FROM emp_master a
      ,dept_master b
 ORDER BY a.emp_id;
 


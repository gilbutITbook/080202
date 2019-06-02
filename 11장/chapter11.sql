-- 쿼리 11-1
CREATE TABLE subway_dml_test AS
SELECT *
  FROM subway_statistics 
 WHERE ROWNUM < 1;

ALTER TABLE subway_dml_test
ADD PRIMARY KEY ( seq_id ) ;


-- 쿼리 11-2
INSERT INTO subway_dml_test
SELECT *
  FROM subway_statistics
 WHERE station_name LIKE '종합운동장%';

COMMIT;

-- 쿼리 11-3
SELECT *
  FROM subway_dml_test;


-- 쿼리 11-4
INSERT INTO subway_dml_test
SELECT *
  FROM subway_statistics;


-- 쿼리 11-5
INSERT INTO subway_dml_test
SELECT *
  FROM subway_statistics
 WHERE station_name NOT LIKE '종합운동장%';
 
COMMIT;

-- 쿼리 11-6
INSERT INTO subway_dml_test
SELECT a.*
  FROM subway_statistics a
 WHERE NOT EXISTS ( SELECT 1
                      FROM subway_dml_test b
                     WHERE a.seq_id = b.seq_id );
					 
-- 쿼리 11-7
DELETE FROM subway_dml_test
WHERE station_name LIKE '종합운동장%';

COMMIT;

-- 쿼리 11-8
SELECT *
  FROM subway_dml_test
 WHERE station_name LIKE '삼성%'
 ORDER BY seq_id; 
 
-- 쿼리 11-9 
UPDATE subway_dml_test
   SET passenger_number = passenger_number + 10
      ,boarding_date    = ADD_MONTHS(boarding_date, 1)
 WHERE station_name LIKE '삼성%';

COMMIT;

-- 쿼리 11-10
SELECT *
  FROM subway_dml_test
 WHERE station_name LIKE '삼성%'
 ORDER BY seq_id; 

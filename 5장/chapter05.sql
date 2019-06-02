-- 쿼리 5-1
SELECT *
  FROM subway_statistics;

  
-- 쿼리 5-2
SELECT seq_id
      ,station_name
      ,boarding_time
      ,passenger_number
 FROM subway_statistics;


-- 쿼리 5-3
SELECT *
  FROM subway_statistics
 WHERE station_name = '잠실(216)'; 

-- 쿼리 5-4
SELECT *
  FROM subway_statistics
 WHERE station_name  = '잠실(216)'
   AND boarding_time = 7
    OR boarding_time = 9;

-- 쿼리 5-5
SELECT *
  FROM subway_statistics
WHERE station_name = '잠실(216)'
  AND ( boarding_time = 7
        OR boarding_time = 9 );
		 
-- 쿼리 5-6
SELECT *
  FROM subway_statistics
 WHERE station_name LIKE '잠실%';

-- 쿼리 5-7
SELECT *
  FROM subway_statistics
 WHERE station_name LIKE '선릉%'
   AND boarding_time IN (7, 9);
  
-- 쿼리 5-8
SELECT *
  FROM subway_statistics
 WHERE station_name LIKE '선릉%'
   AND passenger_number >= 500
   AND passenger_number <= 1000;
  
-- 쿼리 5-9
SELECT *
  FROM subway_statistics
 WHERE station_name LIKE '선릉%'
   AND passenger_number BETWEEN 500 AND 1000;  
  
-- 쿼리 5-10
SELECT *
  FROM subway_statistics
 ORDER BY station_name;
 
-- 쿼리 5-11
SELECT *
  FROM subway_statistics
 WHERE station_name LIKE '선릉%'
 ORDER BY 1, 2, 3, 4, 5, 6;
 
  
  
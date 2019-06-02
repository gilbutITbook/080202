-- 쿼리 7-1
SELECT station_name
  FROM subway_statistics
 WHERE gubun = '승차'
 GROUP BY station_name
 ORDER BY station_name;

-- 쿼리 7-2
SELECT COUNT(*) cnt 
      ,MIN(passenger_number) min_value
      ,MAX(passenger_number) max_value
      ,SUM(passenger_number) sum_value
      ,AVG(passenger_number) avg_value
FROM subway_statistics;


-- 쿼리 7-3
SELECT station_name
      ,COUNT(*) cnt 
      ,MIN(passenger_number) min_value
      ,MAX(passenger_number) max_value
      ,SUM(passenger_number) sum_value
      ,AVG(passenger_number) avg_value
  FROM subway_statistics
 WHERE gubun = '승차'
 GROUP BY station_name
 ORDER BY station_name;
 
-- 쿼리 7-4
SELECT station_name
      ,boarding_time
      ,gubun
      ,MIN(passenger_number) min_value
      ,MAX(passenger_number) max_value
      ,SUM(passenger_number) sum_value
  FROM subway_statistics
 WHERE station_name in ('구로디지털단지(232)')
 GROUP BY station_name, boarding_time, gubun
 ORDER BY station_name, boarding_time, gubun;
 
-- 쿼리 7-5
SELECT station_name
      ,boarding_time
      ,gubun       
      ,MIN(passenger_number) min_value
      ,MAX(passenger_number) max_value
      ,SUM(passenger_number) sum_value
  FROM subway_statistics
 GROUP BY station_name, boarding_time, gubun
 ORDER BY 6 DESC;

-- 쿼리 7-6
SELECT station_name
      ,boarding_time
      ,gubun       
      ,MIN(passenger_number) min_value
      ,MAX(passenger_number) max_value
      ,SUM(passenger_number) sum_value
  FROM subway_statistics
 GROUP BY station_name, boarding_time, gubun
HAVING SUM(passenger_number) BETWEEN 15000 AND 16000
 ORDER BY 6 DESC;
 
-- 쿼리 7-7
SELECT DISTINCT station_name
  FROM subway_statistics
 WHERE gubun = '승차'
 ORDER BY 1;
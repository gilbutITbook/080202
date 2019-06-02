-- 쿼리 12-1
CREATE TABLE lotto_master (
  seq_no       NUMBER NOT NULL, -- 로또회차 
  draw_date    DATE,            -- 추첨일
  num1         NUMBER,          -- 당첨번호1
  num2         NUMBER,          -- 당첨번호2
  num3         NUMBER,          -- 당첨번호3
  num4         NUMBER,          -- 당첨번호4
  num5         NUMBER,          -- 당첨번호5
  num6         NUMBER,          -- 당첨번호6
  bonus        NUMBER           -- 보너스번호
 );
 
ALTER TABLE lotto_master
ADD CONSTRAINTS lotto_master_pk PRIMARY KEY (seq_no);
	
-- 쿼리 12-2	
CREATE TABLE lotto_detail (
    seq_no         NUMBER NOT NULL,  -- 로또회차
    rank_no        NUMBER NOT NULL,  -- 등수
    win_person_no  NUMBER,           -- 당첨자수
    win_money      NUMBER            -- 1인당 당첨금액
 );
 
ALTER TABLE lotto_detail
ADD CONSTRAINTS lotto_detail_pk PRIMARY KEY (seq_no, rank_no);

-- 쿼리 12-3
SELECT num1 ,num2 ,num3  ,num4 ,num5 ,num6 , COUNT(*)
  FROM lotto_master
 GROUP BY num1, num2, num3, num4, num5, num6;
 
-- 쿼리 12-4
SELECT num1 ,num2 ,num3  ,num4 ,num5 ,num6 , COUNT(*)
  FROM lotto_master
 GROUP BY num1, num2, num3, num4, num5, num6
 HAVING COUNT(*) > 1; 
 
-- 쿼리 12-5
SELECT NUM1 lotto_num, COUNT(*) CNT
  FROM lotto_master
 GROUP BY NUM1
 ORDER BY 2 DESC; 
 
-- 쿼리 12-6
SELECT lotto_num, SUM(CNT) AS CNT
  FROM ( SELECT num1 lotto_num, COUNT(*) CNT
           FROM lotto_master
          GROUP BY num1
          UNION ALL
         SELECT num2 lotto_num, COUNT(*) CNT
           FROM lotto_master
          GROUP BY num2
         UNION ALL
         SELECT num3 lotto_num, COUNT(*) CNT
           FROM lotto_master
          GROUP BY num3
         UNION ALL
         SELECT num4 lotto_num, COUNT(*) CNT
           FROM lotto_master
          GROUP BY num4
         UNION ALL
         SELECT num5 lotto_num, COUNT(*) CNT
           FROM lotto_master  
          GROUP BY num5
         UNION ALL
         SELECT num6 lotto_num, COUNT(*) CNT
           FROM lotto_master  
          GROUP BY num6
       )
 GROUP BY lotto_num      
 ORDER BY 2 DESC;  
 
 -- 쿼리 12-7
 SELECT a.seq_no
      ,a.draw_date
      ,b.win_person_no
      ,b.win_money
      ,a.num1 ,a.num2 ,a.num3
      ,a.num4 ,a.num5 ,a.num6 ,a.bonus
  FROM lotto_master a
      ,lotto_detail b
 WHERE a.seq_no = b.seq_no
   AND b.rank_no = 1
 ORDER BY b.win_money DESC;
 
 
-- 쿼리 12-8
CREATE TABLE traffic_accident (
    year              NUMBER       NOT NULL,  -- 연도
    trans_type        VARCHAR2(30) NOT NULL,  -- 교통수단
    total_acct_num    NUMBER,                 -- 사고발생건수
    death_person_num  NUMBER                  -- 사망자수   
);


ALTER TABLE traffic_accident
ADD CONSTRAINTS traffic_accident_pk PRIMARY KEY (year, trans_type);


-- 쿼리 12-9
SELECT CASE WHEN year BETWEEN 1980 AND 1989 THEN '1980년대'
            WHEN year BETWEEN 1990 AND 1999 THEN '1990년대'
            WHEN year BETWEEN 2000 AND 2009 THEN '2000년대'
            WHEN year BETWEEN 2010 AND 2019 THEN '2010년대'
       END AS YEARS
      ,trans_type
      ,SUM(total_acct_num)   AS 사고건수
      ,SUM(death_person_num) AS 사망자수
FROM traffic_accident
WHERE 1=1
GROUP BY CASE WHEN year BETWEEN 1980 AND 1989 THEN '1980년대'
              WHEN year BETWEEN 1990 AND 1999 THEN '1990년대'
              WHEN year BETWEEN 2000 AND 2009 THEN '2000년대'
              WHEN year BETWEEN 2010 AND 2019 THEN '2010년대'
         END, trans_type
ORDER BY 1, 2;


-- 쿼리 12-10
SELECT trans_type
      ,SUM(CASE WHEN year BETWEEN 1980 AND 1989 THEN total_acct_num ELSE 0 END) "1980년대"
      ,SUM(CASE WHEN year BETWEEN 1990 AND 1999 THEN total_acct_num ELSE 0 END) "1990년대"
      ,SUM(CASE WHEN year BETWEEN 2000 AND 2009 THEN total_acct_num ELSE 0 END) "2000년대"
      ,SUM(CASE WHEN year BETWEEN 2010 AND 2019 THEN total_acct_num ELSE 0 END) "2010년대"
FROM traffic_accident
WHERE 1=1
GROUP BY trans_type
ORDER BY trans_type;

-- 쿼리 12-11
SELECT a.*
 FROM traffic_accident a
     ,( SELECT trans_type
              ,MAX(death_person_num) death_per
          FROM traffic_accident
         GROUP BY trans_type
      ) B
WHERE a.trans_type       = b.trans_type
  AND a.death_person_num = b.death_per;

-- 쿼리 12-12
CREATE TABLE fine_dust (
    gu_name           VARCHAR2(50) NOT NULL,  -- 구 명
    mea_station       VARCHAR2(30) NOT NULL,  -- 측정소
    mea_date          DATE         NOT NULL,  -- 측정일자
    pm10              NUMBER,                 -- 미세먼지농도
    pm25              NUMBER                  -- 초미세먼지농도
);

ALTER TABLE fine_dust
ADD CONSTRAINTS fine_dust_pk PRIMARY KEY (gu_name, mea_station, mea_date);


-- 쿼리 12-13
CREATE TABLE fine_dust_standard (
    org_name          VARCHAR2(50) NOT NULL,  -- 기관명
    std_name          VARCHAR2(30) NOT NULL,  -- 미세먼지 기준
    pm10_start        NUMBER,                 -- 미세먼지농도(시작)
    pm10_end          NUMBER,                 -- 미세먼지농도(끝)
    pm25_start        NUMBER,                 -- 초미세먼지농도(시작)
    pm25_end          NUMBER                  -- 초미세먼지농도  (끝)  
);

ALTER TABLE fine_dust_standard
ADD CONSTRAINTS fine_dust_standard_pk PRIMARY KEY (org_name, std_name);

-- 쿼리 12-14 (월간 미세먼지 - 최소,최대,평균 )
SELECT TO_CHAR(a.mea_date, 'YYYY-MM') months
       ,ROUND(MIN(a.pm10),0) pm10_min
       ,ROUND(MAX(a.pm10),0) pm10_max
       ,ROUND(AVG(a.pm10),0) pm10_avg
       ,ROUND(MIN(a.pm25),0) pm25_min
       ,ROUND(MAX(a.pm25),0) pm25_max
       ,ROUND(AVG(a.pm25),0) pm25_avg
  FROM fine_dust a
 WHERE pm10 > 0
   AND pm25 > 0
 GROUP BY  TO_CHAR(mea_date, 'YYYY-MM')
 ORDER BY 1;
 
-- 쿼리 12-15 (월평균 미세먼지 현황)
SELECT a.months
      ,a.pm10_avg
      ,( SELECT b.std_name
           FROM fine_dust_standard b
          WHERE b.org_name = 'WHO'
            AND a.pm10_avg BETWEEN b.pm10_start
                               AND b.pm10_end
       ) "미세먼지 상태"
      ,a.pm25_avg
      ,( SELECT b.std_name
           FROM fine_dust_standard b
          WHERE b.org_name = 'WHO'
            AND a.pm25_avg BETWEEN b.pm25_start
                               AND b.pm25_end
       ) "초미세먼지 상태"      
FROM ( -- 월평균 미세먼지 농도 서브쿼리
       SELECT TO_CHAR(a.mea_date, 'YYYY-MM') months
             ,ROUND(AVG(a.pm10),0) pm10_avg
             ,ROUND(AVG(a.pm25),0) pm25_avg
        FROM fine_dust a
       WHERE a.pm10 > 0
         AND a.pm25 > 0 
       GROUP BY TO_CHAR(mea_date, 'YYYY-MM')
     ) a
ORDER BY 1; 

 -- 문제 1. 최소 당첨금 조회
 SELECT a.seq_no
      ,a.draw_date
      ,b.win_person_no
      ,b.win_money
      ,a.num1 ,a.num2 ,a.num3
      ,a.num4 ,a.num5 ,a.num6 ,a.bonus
  FROM lotto_master a
      ,lotto_detail b
 WHERE a.seq_no = b.seq_no
   AND b.rank_no = 1
   AND b.win_person_no > 0
 ORDER BY b.win_money ;
 
 -- 문제 2. 연속 번호 조회
SELECT *
  FROM lotto_master
 WHERE num1 + 1 = num2
    OR num2 + 1 = num3
    OR num3 + 1 = num4
    OR num4 + 1 = num5
    OR num5 + 1 = num6
ORDER BY 1;  

 -- 문제 3. 교통수단별 사고건수 대비 사망자 수 평균 비율
SELECT trans_type
      ,ROUND(AVG(death_person_num / total_acct_num  * 100),0) death_per
  FROM traffic_accident
 WHERE total_acct_num > 0
 GROUP BY trans_type;
 
-- 문제 4. 2017년 미세먼지 상태별 일 수 
SELECT std_name
      ,COUNT(*)
  FROM ( SELECT b.std_name
               ,a.days
               ,a.pm10_avg
               ,b.pm10_start
               ,b.pm10_end
         FROM fine_dust_standard b
             ,( SELECT TO_CHAR(a.mea_date, 'YYYY-MM-DD') days
                      ,ROUND(AVG(a.pm10),0) pm10_avg
                 FROM fine_dust a
                WHERE a.mea_date < TO_DATE('2018-01-01', 'YYYY-MM-DD')
                GROUP BY  TO_CHAR(mea_date, 'YYYY-MM-DD')
               ) a
         WHERE b.org_name = 'WHO'
           AND a.pm10_avg BETWEEN b.pm10_start 
                              AND b.pm10_end
         )
   GROUP BY std_name; 


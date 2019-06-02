-- 쿼리 10-1
SELECT a.emp_id
      ,a.emp_name
      ,a.gender
      ,a.age
      ,a.dept_id
      ,( SELECT b.dept_name
           FROM dept_master b
          WHERE a.dept_id = b.dept_id ) dept_name
FROM emp_master a;


-- 쿼리 10-2
SELECT a.emp_id
      ,a.emp_name
      ,a.gender
      ,a.age
      ,a.dept_id
      ,b.dept_name
 FROM emp_master a
     ,dept_master b
WHERE a.dept_id = b.dept_id(+);


-- 쿼리 10-3
SELECT a.dept_id
      ,a.dept_name
      ,k.emp_id
      ,k.emp_name
      ,k.address 
  FROM dept_master a
      ,( SELECT b.emp_id
               ,b.emp_name
               ,c.city || c.gu || c.address_name AS address
               ,b.dept_id
           FROM emp_master b
               ,address_master c
          WHERE b.address_id = c.address_id
       ) k
 WHERE a.use_yn = 'Y'
   AND a.dept_id = k.dept_id
 ORDER BY 1, 3;
 
 
-- 쿼리 10-4 
SELECT *
  FROM dept_master a      
 WHERE a.dept_id = ( SELECT b.dept_id
                       FROM emp_master b
                      WHERE b.emp_name = '세종대왕'
				    )
;
			
-- 쿼리 10-5
SELECT *
  FROM dept_master a
 WHERE a.dept_id IN ( SELECT b.dept_id
                        FROM emp_master b
                       WHERE b.age BETWEEN 40 AND 49
                    );			

					
-- 쿼리 10-6				
SELECT *
  FROM emp_master a
 WHERE ( a.gender, a.age) IN ( SELECT b.gender, b.age
                                  FROM emp_master b
                                      ,address_master c
                                 WHERE b.address_id = c.address_id
                                   AND c.gu IN ('중구', '서대문구')
                              );	
							  
-- 쿼리 10-7
SELECT *
  FROM dept_master a      
 WHERE EXISTS ( SELECT 1
                  FROM emp_master b
                 WHERE b.age BETWEEN 40 AND 49
                   AND a.dept_id = b.dept_id
              );

-- 쿼리 10-8
SELECT *
  FROM dept_master a      
 WHERE a.dept_id NOT IN ( SELECT b.dept_id
                            FROM emp_master b
                           WHERE b.age BETWEEN 40 AND 49
                        );	

-- 쿼리 10-9
SELECT *
  FROM dept_master a      
 WHERE NOT EXISTS ( SELECT 1
                      FROM emp_master b
                     WHERE b.age BETWEEN 40 AND 49
                       AND a.dept_id = b.dept_id
                   );						
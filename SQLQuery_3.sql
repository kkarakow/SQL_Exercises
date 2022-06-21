SELECT b.department_id, department_name, COUNT(*) AS Emp_Count
FROM employees a 
    INNER JOIN DEPARTMENTS b ON (a.department_id = b.department_id)
GROUP BY b.department_name, b.department_id  
HAVING AVG(salary) > 5000;
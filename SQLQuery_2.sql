SELECT b.department_name, COUNT(*) AS Emp_Count
FROM employees a 
    INNER JOIN DEPARTMENTS b ON (a.department_name = b.department_name)
GROUP BY b.department_name    
HAVING count(AVG(salary)) > 5000;
SELECT d.country_id, country_name
FROM employees a 
    INNER JOIN departments b ON (a.department_id=b.department_id)
    INNER JOIN locations c ON (b.location_id=c.location_id)
    INNER JOIN countries d ON (c.country_id=d.country_id)
GROUP BY d.country_id, d.country_name
HAVING count(employee_id) > 1;    
    
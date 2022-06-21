SELECT a.manager_id, b.first_name, b.last_name
FROM employees a 
    INNER JOIN employees b ON (a.manager_id = b.employee_id)
        WHERE a.manager_id = a.manager_id
GROUP BY a.manager_id, b.first_name, b.last_name
HAVING count(a.employee_id) > 2;            
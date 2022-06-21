SELECT Employee_ID, First_Name, Last_Name, Salary
CASE
    WHEN Salary > 10000 THEN 'High'
    WHEN Salary > 6000 AND Salary <= 10000 THEN 'Medium'
    WHEN Salary <= 6000 THEN 'Low'
    END AS "Salary"
FROM hr.Employees;
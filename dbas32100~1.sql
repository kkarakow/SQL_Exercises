SELECT  Last_Name, First_Name
FROM hr.Employees
WHERE Employee_ID = 100
UNION
SELECT First_Name, Last_Name
FROM hr.Employees
WHERE Employee_ID = 100
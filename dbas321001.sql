SELECT COUNT(Student_ID) AS "Number of Students"
FROM dbo.Student s
INNER JOIN dbo.Program p ON s.program_ID = p.program_ID
WHERE Program_Name='computer programmer';
    
SELECT Program_name 
FROM dbo.Program p
INNER JOIN Student s ON p.Program_id = s.Program_id 
GROUP BY Campus_id 
ORDER BY COUNT(Student.*) DESC;    

SELECT Course_Name, Program_Name, Campus_Name 
FROM dbo.Course c
WHERE c.Program_ID IN (SELECT p.Program_ID FROM dbo.Program p
WHERE p.Campus_ID = (SELECT a.Campus_ID FROM dbo.Campus a))
WHERE Teacher_ID = 9766;

SELECT AVG(s.Student_GPA) AS 'AVEGARE GPA' 
FROM dbo.Student s
WHERE s.Program_ID IN
(SELECT p.Program_ID FROM dbo.Program p 
WHERE p.Campus_ID = (SELECT c.Campus_ID FROM dbo.Campus c 
WHERE c.Campus_Name = 'Trafalgar'))
GROUP BY s.Program_ID;

SELECT ROUND(AVG(Tuition_Fees) AS "Avg Tuition per Program", 
(SELECT ROUND(AVG(Tuition_Fees) AS "Avg Tuition per Campus"
FROM dbo.Program GROUP BY Campus_ID) 
FROM dbo.Program GROUP BY Program_ID;
   
   
   
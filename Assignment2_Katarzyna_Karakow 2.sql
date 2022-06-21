/* 
1. For every program, return the program name, campus name, tuition fee and the average
tuition fee for the programs that are taught in in the same campus as this program. For
example if computer science program is taught in Davis campus then I want you to return the
program name, campus name, tuition fee of the program and the average tuition fee for all the
programs that are taught in Davis campus 
*/

SELECT p.Program_Name, c.Campus_Name, p.Tuition_Fees, ROUND(AVG(p.Tuition_Fees)) AS "Average Tuition"
FROM dbo.Program p 
INNER JOIN dbo.Campus c ON p.Campus_ID=c.Campus_ID
GROUP BY c.Campus_ID;

/* 
2. Return the name of the teacher(s) who have the 3rd highest salary
WORKING
*/

SELECT Teacher_Name, Teacher_Salary
FROM dbo.Teacher t1
WHERE 2= (SELECT COUNT(Teacher_Salary)
FROM dbo.Teacher t2
WHERE t2.Teacher_Salary > t1.Teacher_Salary);

/*
3. For every student, return the difference between the student gpa and the average gpa of the
students who were admitted 30 days before and 30 days after the admission date of the
student
*/

SELECT s1.Student_GPA s2.avg_score
FROM dbo.Student s1, dbo.Student s2
WHERE s2.Student_Admission_Date BETWEEN(
s1.Student_Admission_Date - INTERVAL 30 DAY)
AND (s1.Student_Admission_Date + INTERVAL 30 DAY)
GROUP BY s1.Student_ID;

/*
4. Teacher table is queried often using teacher name as the condition. Create an index that will
improve the performance of this query. You need to choose the most appropriate index
WORKING
*/

CREATE INDEX index_Teacher_Name ON dbo.Teacher(Teacher_Name);

/*
5. Write SQL statement that will create student table as index organized table
*/

CREATE TABLE dbo.Student ORGANISATION INDEX AS SELECT * FROM dbo.Student;















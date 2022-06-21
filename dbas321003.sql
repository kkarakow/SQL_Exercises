INSERT INTO Campus (Campus_ID, Campus_Name,Campus_Address, Campus_City) 
VALUES (1, 'Davis', 'Brampton1', 'Brampton');
INSERT INTO Campus (Campus_ID, Campus_Name,Campus_Address, Campus_City) 
VALUES (2, 'Trafalgar', 'Trafalgar Road', 'Oakville');
INSERT INTO Campus (Campus_ID, Campus_Name,Campus_Address, Campus_City) 
VALUES (3, 'HMC', 'Mississauga1', 'Mississauga');

SELECT * FROM Campus;


INSERT INTO Course(Course_ID, Course_Name, Course_Semester, Program_ID, Teacher_ID)
VALUES (101, 'Database', '2', 101, 9766);
INSERT INTO Course(Course_ID, Course_Name, Course_Semester, Program_ID, Teacher_ID)
VALUES (102, 'Java1', '1', 102, 9746);
INSERT INTO Course(Course_ID, Course_Name, Course_Semester, Program_ID, Teacher_ID)
VALUES (103, 'Mobile dev', '4', 101, 9763);
INSERT INTO Course(Course_ID, Course_Name, Course_Semester, Program_ID, Teacher_ID)
VALUES (104, 'PMP', '2', 102, 9769);
INSERT INTO Course(Course_ID, Course_Name, Course_Semester, Program_ID, Teacher_ID)
VALUES (105, 'Database mgmt', '3', 102, 9776);

SELECT * FROM Course;

INSERT INTO Teacher(Teacher_ID, Teacher_Name, Teacher_Salary)
VALUES(9766, 'John', 2.45);
INSERT INTO Teacher(Teacher_ID, Teacher_Name, Teacher_Salary)
VALUES(9746, 'Ann', 2.35);
INSERT INTO Teacher(Teacher_ID, Teacher_Name, Teacher_Salary)
VALUES(9763, 'Tom', 9.87);
INSERT INTO Teacher(Teacher_ID, Teacher_Name, Teacher_Salary)
VALUES(9769, 'Bart', 3.45);
INSERT INTO Teacher(Teacher_ID, Teacher_Name, Teacher_Salary)
VALUES(9776, 'Kate', 2.24);

SELECT * FROM Teacher;

INSERT INTO Program(Program_ID, Program_Name, Program_Description, Tuition_Fees, Program_Coordinator_ID, Campus_ID)
VALUES(101, 'CP', 'aaaaa', 1899, 1, 1);
INSERT INTO Program(Program_ID, Program_Name, Program_Description, Tuition_Fees, Program_Coordinator_ID, Campus_ID)
VALUES(102, 'ITC', 'aaaaa', 2899, 1, 2);

SELECT * FROM Program;

INSERT INTO Student(Student_ID, Student_Name, Student_Type, Student_Admission_Date, Student_GPA, Program_ID)
VALUES (111, 'Adam', 'FT', '2020-09-01', 3.45, 101);
INSERT INTO Student(Student_ID, Student_Name, Student_Type, Student_Admission_Date, Student_GPA, Program_ID)
VALUES (112, 'Stacey', 'FT', '2020-09-21', 3.05, 101);
INSERT INTO Student(Student_ID, Student_Name, Student_Type, Student_Admission_Date, Student_GPA, Program_ID)
VALUES (113, 'Vicky', 'FT', '2021-09-01', 3.95, 101);
INSERT INTO Student(Student_ID, Student_Name, Student_Type, Student_Admission_Date, Student_GPA, Program_ID)
VALUES (114, 'Tim', 'FT', '2021-09-10', 2.45, 102);
INSERT INTO Student(Student_ID, Student_Name, Student_Type, Student_Admission_Date, Student_GPA, Program_ID)
VALUES (115, 'Dan', 'FT', '2020-09-14', 3.25, 102);
INSERT INTO Student(Student_ID, Student_Name, Student_Type, Student_Admission_Date, Student_GPA, Program_ID)
VALUES (116, 'Nina', 'FT', '2020-09-18', 3.11, 102);

SELECT * FROM Student;

SELECT c.Campus_ID, p.Program_Name, p.Tuition_Fees, AVG(p.Tuition_Fees) AS "Average Tuition"
FROM Program p 
INNER JOIN Campus c ON p.Campus_ID=c.Campus_ID
GROUP BY c.Campus_ID;

SELECT COUNT(Student_ID) AS "Number of Students"
FROM Student s
INNER JOIN Program p ON s.program_ID = p.program_ID
WHERE Program_Name='CP';

SELECT Program_id, Program_name, Campus_ID 
FROM Program p
INNER JOIN Student s ON p.Program_id = s.Program_id
INNER JOIN Campus c ON s.Program_id = c.Program_ID
GROUP BY Campus_ID 
ORDER BY COUNT(Student_ID) DESC; 

SELECT Course_Name, Program_Name, Campus_ID 
FROM Course c
WHERE c.Program_ID IN (SELECT p.Program_ID FROM Program p
WHERE p.Campus_ID = (SELECT a.Campus_ID FROM Campus a))
Having Teacher_ID = 9766;

SELECT AVG(s.Student_GPA) AS "AVEGARE GPA" 
FROM Student s
WHERE s.Program_ID IN
(SELECT p.Program_ID FROM Program p 
WHERE p.Campus_ID = (SELECT c.Campus_ID FROM Campus c 
WHERE c.Campus_Name = 'Trafalgar'))
GROUP BY s.Program_ID;

SELECT ROUND(AVG(Tuition_Fees)) AS "Avg Tuition per Program", 
(SELECT ROUND(AVG(Tuition_Fees)) AS "Avg Tuition per Campus"
FROM Program GROUP BY Campus_ID) 
FROM Program GROUP BY Program_ID;

SELECT p.Program_Name, c.campus_id, c.campus_name, p.Tuition_Fees, ROUND(AVG(p.Tuition_Fees)) AS "Average Tuition"
FROM Program p 
INNER JOIN Campus c ON p.Campus_ID=c.Campus_ID
GROUP BY Campus_ID;

SELECT Teacher_Name, Teacher_Salary
FROM Teacher t1
WHERE 2= (SELECT COUNT(Teacher_Salary)
FROM Teacher t2
WHERE t2.Teacher_Salary > t1.Teacher_Salary);

SELECT s1.Student_ID, AVG(s1.Student_GPA), s2.Student_ID, AVG(s2.Student_GPA)
FROM Student s1, Student s2
WHERE s2.Student_Admission_Date BETWEEN(
s1.Student_Admission_Date - INTERVAL (30=DAY))
AND (s1.Student_Admission_Date + INTERVAL (30=DAY))
GROUP BY s1.Student_ID, s1.Student_GPA, s2.Student_ID;

CREATE INDEX index_Teacher_Name ON Teacher(Teacher_Name);

CREATE TABLE Student ORGANISATION AS (SELECT * FROM Student);


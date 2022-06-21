--single line comments
/* multiline
comment */

--sql Structured Query Language
-- Basci SQL Statement - SELECT



/* print all data from employees table */
SELECT * FROM employees;

/* print all data for employees where employee_id is 101; = is the comarison operator of equals */
SELECT * FROM employees WHERE employee_id=101;

/* select all employees where salary is either 4000 or 6000 */
SELECT * FROM employees WHERE salary=40000 OR salary=6000;

/* print employees where salary is between 4000 and 6000 */
SELECT * FROM employees WHERE salary>=4000 AND salary<60000;
--OR
SELECT * FROM employees WHERE salary BETWEEN 4000 AND 6000;
--NOT
/* print employees where salary is NOT between 4000 and 6000 */
SELECT * FROM employees WHERE salary NOT BETWEEN 4000 AND 6000;
--OR
SELECT * FROM employees WHERE salary<=4000 OR salary>60000;


/* PROJECTION QUARIES */
/* select column1, column2.... from tablename where condition; */
--print first_name, last_name of all employees
SELECT first_name, last_name FROM employees;

/* print all job titles having max_salary is = 16000 */
SELECT job_title FROM jobs WHERE max_salary=16000;

--rename columns in output
--print first_name, last_name of all employees with renaming columns
SELECT first_name AS "FNAME", last_name AS "LNAME" FROM employees;
--print all job title, max_salary having max_salary >= and rename job_title as Highest Paid Jobs
SELECT job_title AS "Highest Paid Jobs", max_salary FROM jobs WHERE max_salary>=16000;
--OR
SELECT job_title "Highest Paid Jobs", max_salary FROM jobs WHERE max_salary>=16000;


-- is null , is not null
--print all employees first_name where commission_pct is not given or null
SELECT first_name FROM employees WHERE commission_pct IS NULL;
--print all employees first_name where commission_pct is not given
SELECT first_name, commission_pct FROM employees WHERE commission_pct IS NOT NULL;


--wildcards - % (0..M) and _ (underscoree - exactly 1 character)
--print all firstnames starting with letter A
-- string pattern matching operator - LIKE operator
SELECT first_name FROM employees WHERE first_name LIKE 'A%';
--print all firstnames ending with letter A
SELECT first_name FROM employees WHERE first_name LIKE '%A';
--print all names where first letter is A, second letter is must and be anything and then any number of characters
SELECT first_name FROM employees WHERE first_name LIKE 'A_%';
--print all employees where name is either Adam, Neena or Amit
--anything from a set - in
--opposite is -- not in
--print all employees where name is either Amit, Adam, Neena
SELECT * FROM employees WHERE first_name IN ('amit', 'adam', 'neena');
--in works like where cond1 or cond2 or cond3....
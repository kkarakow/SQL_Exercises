	/*
Create a function that converts Kilometers to Miles or Miles to Kilometer (the function has to be
able to do both conversions). You can google the conversion equation. You need to use the
most suitable data types for this operation.
*/

CREATE FUNCTION ConvertKgAndLb (x NUMBER)
RETURN NUMBER
    IS
BEGIN
    DBMS_OUTPUT.put_line(x||'kg= '||x/0.453||' lb');
    DBMS_OUTPUT.put_line(x||'lb= '||x/2.205||' kg');
    RETURN 0;
END;

/* Calling the function */
DECLARE
    y NUMBER;
BEGIN 
    y:=ConvertKgAndLb(5);
END;    

/*
Create a stored procedure that deletes all the employees who have a certain manager from
MyEmployees table. You need to pass the manager id as an argument to the procedure.
*/

CREATE OR REPLACE PROCEDURE deleteEmployee 
    (managerid IN NUMBER)
AS 
BEGIN 
    FOR rec IN
    (SELECT manager_id 
    FROM MyEmployees 
    WHERE manager_id=managerid)
    LOOP
        DBMS_OUTPUT.put_line(rec.manager_id);
    DELETE FROM MyEmployees 
    WHERE manager_id=managerid;
    END LOOP;    
END;

/*Calling the function*/
BEGIN
    deleteEmployee('114');
END;    

/*
Create a trigger on MyEmployees table that will change commission to 0.99 if a new row is
inserted or a row is updated where salary is less than 6000 (this means that the employees
who have salary less than 6000 will have a commission of 0.99%)
*/

CREATE OR REPLACE TRIGGER CommChange
AFTER INSERT
ON MyEmployees
FOR EACH ROW
DECLARE
    salaryNew NUMBER(8,2);
BEGIN
    salaryNew:=:NEW.salary;
    IF salaryNew < 6000 THEN
    UPDATE MyEmployees SET commission_pct=0.99 WHERE employee_id=:NEW.employee_id;
    END IF;
END;    









CREATE TABLE Item
(I_ID NUMBER(2),
I_Class VARCHAR2(1),
I_Subclass VARCHAR2(2),
I_Color VARCHAR2(6),
I_name VARCHAR2(1),
I_cost NUMBER(5,2),
I_Price NUMBER(5,2),
I_ManufactureYear NUMBER(4),
I_ManufactureDate DATE,
I_Composition_ID NUMBER(2));

INSERT INTO Item VALUES(1, 'A', 'A1', 'Red', 'k', 25, 30, 2014, '2014-07-01', 2);
INSERT INTO Item VALUES(2, 'A', 'A2', 'Red', 'l', 10, 20, 2014, '2014-07-21', 5);
INSERT INTO Item VALUES(3, 'A', 'A1', 'Blue', 'd', 15, 20, 2016, '2016-03-21', 2);
INSERT INTO Item VALUES(4, 'A', 'A2', 'Blue', 'f', 5, 10, 2016, '2016-04-19', 8);
INSERT INTO Item VALUES(5, 'A', 'A2', 'Blue', 'f', 5, 10, 2016, '2016-02-29', NULL);
INSERT INTO Item VALUES(6, 'B', 'B1', 'Red', 'l', 45, 50, 2017, '2017-11-12', 8);
INSERT INTO Item VALUES(7, 'B', 'B2', 'Red', 'f', 100, NULL, 2017, '2017-12-06', 5);
INSERT INTO Item VALUES(8, 'B', 'B1', 'Blue', 'q', 25, 20, 2018, '2018-03-21', 5);

COMMIT;


SELECT I_ID, I_NAME, I_Color, I_Composition_ID, LEVEL
FROM Item
START WITH I_ID = 5
CONNECT BY PRIOR I_ID = I_Composition_ID
ORDER BY LEVEL, I_ID;
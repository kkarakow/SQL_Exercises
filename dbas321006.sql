/*Task 1 – write scripts or document a process that refreshes 
(copy new or changed addresses) the address table in the oracle database 
with the addresses in the master table (the table in SQL server database).  
You will need to transform some data types and generate a sequential id for 
the address. Also note that the ids of some addresses will be used as 
foreign key in donation table your solution should accommodate this fact. 
It does not have to be one scrip. 
You can make this task as a sequence of separate processes*/


CREATE SEQUENCE add_seq
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

ALTER TABLE Address  
ADD Address_ID NUMBER(10) DEFAULT add_seq.nextval NOT NULL;
  
ALTER TABLE Address ADD (
  CONSTRAINT add_pk PRIMARY KEY (Address_ID));
  
/*Task 5 - Create views to address the following:*/  
/*•	The number of donations and total donations 
for each date showing the date hierarchy 
(year, long month name, day).  */  

CREATE VIEW v1 AS SELECT COUNT(Donation_ID),SUM(Donation_Amount), 
Donation_Date, Don_year, month_name_long, Don_day
FROM Donations 
GROUP BY Donation_Date, Don_year, month_name_long, Don_day;

/*•	The number of donations, sums and average donations 
by location hierarchy (postal code and address)*/

CREATE VIEW v2 AS SELECT AVG(Donation_Amount), SUM(Donation_Amount), 
address, postal_code 
FROM Donations
GROUP BY address, postal_code;

/*•	The number of donations, sums and average by volunteer leader and volunteer*/

CREATE VIEW v3 AS SELECT AVG(Donation_Amount), SUM(Donation_Amount), 
Volunteer_number, Volunteer_name 
FROM Donations
GROUP BY Volunteer_number, Volunteer_name; 

CREATE TABLE Donation 
(Don_ID NUMBER PRIMARY KEY,
Donor_First_name VARCHAR2(16),
Donor_Last_name VARCHAR2(16),
Donation_Date Date NOT NULL,
Donation_Amount NUMBER(7,1) NOT NULL,
Address_ID NOT NULL,
Volunteer_ID NOT NULL,
CONSTRAINT fk_don_add
FOREIGN KEY (Address_ID) REFERENCES Address(Address_ID),
CONSTRAINT fk_don_vol
FOREIGN KEY (Volunteer_ID) REFERENCES Volunteer(Volunteer_ID));

CREATE TABLE Address(
Address_ID NUMBER PRIMARY KEY,
Unit_Num VARCHAR2(6),
Street_Number NUMBER NOT NULL,
Street_Name VARCHAR2(24) NOT NULL,
Street_Type VARCHAR2(12) NOT NULL,
Street_Direction CHAR(1),
Postal_Code CHAR(7) NOT NULL,
City VARCHAR2(16) NOT NULL,
Province CHAR(2) NOT NULL,
CONSTRAINT St_Dir CHECK
(Street_Direction IN ('E', 'W', 'N', 'S')));

CREATE TABLE Volunteer(
Volunteer_ID NUMBER PRIMARY KEY,
First_name VARCHAR2(16),
Last_name VARCHAR2(16),
Group_Leader,
CONSTRAINT fk_vol_lead
FOREIGN KEY (Group_Leader)
REFERENCES Volunteer(Volunteer_ID));


CREATE TABLE Don_Date(
Date_ID NUMBER PRIMARY KEY,
Don_date DATE,
Don_year NUMBER(4),
month_number NUMBER(2),
day_number_in_month NUMBER(2),
month_name_short VARCHAR2(3),
month_name_long VARCHAR2(10)
);

CREATE SEQUENCE sequence_ID 

START WITH 1 

INCREMENT BY 1 

NOCACHE 

NOCYCLE; 

CREATE TABLE DonationFileTempTable 

( 

    address_Temp VARCHAR2(240), 

    donorname_Temp VARCHAR2(240),   

    date_hold VARCHAR2(20), 

    time_hold VARCHAR2(20), 

    amount_hold NUMBER(8,2), 

    type_hold VARCHAR2(20), 

    volunteer_hold NUMBER 

); 

CREATE TABLE FileErrorDonate 

( 

    add_error VARCHAR2(240), 

    donorNme_error VARCHAR2(240),   

    dte_error VARCHAR2(20), 

    time_error VARCHAR2(20), 

    amt_error NUMBER(7,2), 

    tpe_error VARCHAR2(20), 

    volun_ID_Error NUMBER, 

    dte_error date 

); 

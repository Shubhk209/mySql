/*
	ADVANCE OR INTELLIGENT
	
	1. LEFT JOIN
	- to get only non-matched data from Left Table . 

	1. LEFT JOIN
	- to get only non-matched data from Right Table .

	3.Full JOIN
	- non-matched data from Right Table + non-matched data from Left Table
*/
go

--CREATE DATABASE Sample;

Use Sample
go


-- Create and insert data into tblEmployee2 and tblDepartment

CREATE TABLE tblDepartment	(ID INT IDENTITY PRIMARY KEY,
							 [DEPARTMENT NAME] NVARCHAR(50),
							 LOCATION NVARCHAR(50),
							 [DEPARTMENT HEAD] NVARCHAR(50)
							);

INSERT INTO tblDepartment	([DEPARTMENT NAME],LOCATION,[DEPARTMENT HEAD])
VALUES	('IT', 'London','Rick'),
		('Payroll', 'Delhi','Ron'),
		('HR', 'New York','Christie'),
		('Other Department', 'Sydney','Dally');

select * from tblDepartment;

CREATE TABLE tblEmployee2	(ID INT IDENTITY,
							 NAME NVARCHAR(30),
							 GENDER NVARCHAR(10),
							 SALARY INT ,
							 DEPARTMENT_ID INT FOREIGN KEY REFERENCES tblDepartment(ID) ,
							 CONSTRAINT PK_tblEmployee PRIMARY KEY (ID)
							);

INSERT INTO tblEmployee2(NAME,GENDER,SALARY,DEPARTMENT_ID)
VALUES	('Tom', 'Male', 40000, 1),
		('Pam', 'Female', 30000, 3),
		('John', 'Male', 35000, 1),
		('Sam', 'Male', 45000, 2),
		('Tod', 'Male', 28000, 2),
		('Ben', 'Male', 70000, 1),
		('Sara', 'Male', 48000, 3),
		('Valarie', 'Male', 55000, 1),
		('James', 'Male', 65000, NULL),
		('Rushell', 'Male', 88000, Null);

Select * from tblEmployee2;
go


-- Non-Match Rows from Left Join

select e.ID,NAME,GENDER,SALARY, d.[DEPARTMENT NAME], d.[DEPARTMENT HEAD]
from tblEmployee2 as e LEFT OUTER JOIN tblDepartment as d
on e.DEPARTMENT_ID = d.ID
where d.ID IS null;


-- Non-Match Rows from Right Join

select e.ID,NAME,GENDER,SALARY, d.[DEPARTMENT NAME], d.[DEPARTMENT HEAD]
from tblEmployee2 as e Right OUTER JOIN tblDepartment as d
on e.DEPARTMENT_ID = d.ID
where e.DEPARTMENT_ID IS null;


-- Non-Match Rows from FULL Join
-- Non-Match Rows from Left Join + Non-Match Rows from Right Join

select e.ID,NAME,GENDER,SALARY, d.[DEPARTMENT NAME], d.[DEPARTMENT HEAD]
from tblEmployee2 as e FULL OUTER JOIN tblDepartment as d
on e.DEPARTMENT_ID = d.ID
where	d.ID	IS null 
		OR 
		e.DEPARTMENT_ID IS null;
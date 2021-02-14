/*
	Store Procedure
	- group of t-sql(transact sql) statements

	
	
	SCENERIO :
	- When need to do repeated a task/query like (select, insert...)
		- we can specify the query in store procedure once and call it by it's name.
	
	- WORA (Write Once Run Anywhere) like concept.

	- Code reusabilty(query) just like function in programming language.

	-------------------------------------------------------------------------------------------
	
	1. CREATION OF STORE PROCEDURE
	- SYNTAX:
		CREATE PROCEDURE <SP_NAME>
		AS 
		BEGIN
			--T-SQL statements
		END

	NOTE:
	- Microsoft recommend not to use sp_ as a prefix.
		- all system store procedure are prefix with sp_ .
		- avoid ambiguity between user defined and system defined stored procedures and conflicts.

	
	

	--------------------------------------------------------------------------------------------------
	
	TO EXECUTE THE STORE PROCEDURE
	1. SELECT STORE PROCEDURE NAME + F5/Execute Button.
	2. EXEC <store_procedure_name>
	3. Execute <store_procedure_name


	NOTE:
	- right click on store procedure name [ in Object explorer in SQL Server Management Studio]
		- Select  Execute Stored Procedure.

	-------------------------------------------------------------------------------------------
	
	
	2. CREATION OF STORE PROCEDURE WITH INPUT PARAMETER.
	- SYNTAX:
		CREATE PROCEDURE <SP_NAME>
		@VariableName DataType, @VariableName2 DataType
		AS 
		BEGIN
			--T-SQL statements
		END



	
	EXECUTION OF STORE PROCEDURE
	- SYNTAX:
		EXEC <SP_NAME> PARAMETER1, PARAMETER2,.....;

	
	NOTE:
	-- Order of parameters should be same as Stored procedure defination.
	-- Else get Error: 
		--Error converting data type varchar to int.

	------------------------------------------------------------------------

	VIEW DEFINATION OF STORE PROCEDURE

	1. USE SYSTEM STORE PROCEDURE
		- sp_helptext <SP_NAME>;

	2. GUI
	-	Databases/ database_name/ Programmability/ stored Procedure
		
		- Right click on store procedure
			-Select  Script Store Procedure as / Create To / New Query Window Editor

	---------------------------------------------------------------------------------
	
	ALTER/MODIFY STORE PROCEDURE
	- SYNTAX:

		ALTER PROCEDURE <SP_NAME>
		AS 
		BEGIN
			--T-SQL statements
		END


	---------------------------------------------------
	DROP THE STORED PROCEDURE
	
	- SYNTAX:
		DROP PROC <SP_NAME>

		OR

		DROP PROCEDURE <SP_NAME>

	
	- GUI
		- select the store procedure in object explorer 
			- Right click / select Delete

	---------------------------------------------------
	ENCRYPT THE TEXT OF THE STORE PROCEDURE
	- It is not possible to view the text of stored procedure after encryption.
	
	- use WITH ENCRYPTION 
		-while CREATE or ALTER

	- Message\ERROR when we use to view using system Store procedure (sp_helptext)
			-The text for object 'spGetEmployees' is encrypted.


-----------------------------------------------------------------------------------

	ADVANTAGES OF STORE PROCEDURE

	1. EXECUTION PLAN RETENTION AND REUSABLITY
	- With change in parameter in query, sql engine need to create another execution plan.
	- While in SP, even with change in parameter, sql engine reuse the previous execution plan.

	2. REDUCE NETWORK TRAFFIC 
	- Store Procedure need to send only one line of code to execute from client to server (Adhoc Network).
	- In Query way, we need to send more than 1 code of line to get the same result on network traffic.
		- Maybe more 2k code of line in large organization.

	3. CODE REUSABILITY AND BETTER MAINTAINABLITY
	- multiple client use it from server (reuse).
	- bug fix or change is easy.
		- we just need to change in one place( maintainabilty).

	4. BETTER SECURITY
	- Grant control provide only granted data from a table to paricular client. 

	5. AVOID SQL INJECTION ATTACK
	

	 			
*/
go

--create database Sample;
use Sample
go


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


--Create store procedure

CREATE PROCEDURE spGetEmployees
AS
BEGIN

	Select * from tblEmployee2;

END

-- batch separator 'GO'
go	



-- execute store prcedure
EXEC spGetEmployees;

Execute spGetEmployees;
go



-- Create store procedure with takes 2 parameters.

CREATE PROCEDURE spGetEmployeeByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int

AS
BEGIN
	SELECT NAME,DEPARTMENT_ID
	FROM tblEmployee2
	WHERE GENDER = @Gender AND DEPARTMENT_ID= @DepartmentId 
		
END 



--EXECUTE SP WITH INPUT PARAMETER

EXEC spGetEmployeeByGenderAndDepartment 'MALE', 1;

EXEC spGetEmployeeByGenderAndDepartment 1,'MALE';		--ERROR

EXEC spGetEmployeeByGenderAndDepartment @DepartmentId=1, @Gender ='MALE';

go



-- View Defination of store procedure.


sp_helptext spGetEmployees
go


-- ALTER STORED PROCEDURE

ALTER PROCEDURE spGetEmployees
AS
BEGIN

	Select NAME,GENDER from tblEmployee2;

END
GO


ALTER PROCEDURE spGetEmployeeByGenderAndDepartment
@Gender nvarchar(20),
@DepartmentId int

AS
BEGIN
	SELECT NAME,DEPARTMENT_ID
	FROM tblEmployee2
	WHERE GENDER = @Gender AND DEPARTMENT_ID= @DepartmentId
	ORDER BY NAME;  
		
END 

GO


--ENCRYPT THE TEXT OF THE STORE PROCEDURE


CREATE PROCEDURE spGetEmployees
WITH ENCRYPTION
AS
BEGIN

	Select NAME,GENDER from tblEmployee2;

END
GO

--view defination of SP
sp_helptext spGetEmployees
go

ALTER PROCEDURE spGetEmployees
WITH ENCRYPTION
AS
BEGIN

	Select NAME,GENDER from tblEmployee2
	order by name;

END
GO
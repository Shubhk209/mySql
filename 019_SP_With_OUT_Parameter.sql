/*
	STORED PROCEDRE WITH OUTPUT PARAMETER.
	- we use keyword OUTPUT or OUT.

	-SYNTAX:
		CREATE PROCEDURE <SP_NAME>
		@VariableName DataType, 
		@VariableName2 DataType OUTPUT
		AS 
		BEGIN
			--T-SQL statements
		END

---------------------------------------------------------
	TO EXECUTE THE STORED PROCEDURE WITH OUTPUT PARAMETER
	
	1. DECLARE A VARIABLE TO STORE THE RETURN VALUE FROM STORED PROCEDURE
	
		DECLARE @vARIABLE_NAME DATATYPE
		
	2. EXECCUTE THE STORE PROCEDURE WITH INPUT PARAMETER AND OUTPUT VARIABLE 
	
		EXECUTE SP_NAME INPUT_PARAMETER_VALUE, @VARIABLE_NAME  OUTPUT	
		
	3. PRINT THE VARIABLE
	
		PRINT @VARIABLE_NAME	 


	NOTE:
	- IF WE DONT SPECIFY THE OUTPUT KEYWORD, WHEN EXECUTING THE STORED PROCEDURE 
		- THE @EmployeeTotal variable will be NULL.
-------------------------------------------------------------------------------------
	USEFUL SYSTEM STORE PROCEDURES

	1. sp_help
	- Reports information about a database object (any object listed in the sys.sysobjects compatibility view), 
		- a user-defined data type, or a data type.
	- Database object like SP, triggers, view, etc

	- Alt + f1 (After highlight the dbo)
	- When name is not specified, sp_help lists object names, owners, 
		- and object types for all objects in the current database. 
			-sp_helptrigger provides information about triggers.


	2. sp_helptext <PARAMETER>
	- Displays the definition 
		- user-defined rule, 
		- default, 
		- unencrypted Transact-SQL stored procedure,
		- user-defined Transact-SQL function, 
		- trigger, 
		- computed column, 
		- CHECK constraint,
		- view, 
		- system object such as a system stored procedure.
	
	- The definition resides in the definition column in the sys.sql_modules catalog view.

	3. sp_depends <PARAMETER>
	- Displays information about database object dependencies 
		- views and procedures that depend on a table or view,  
		- the tables and views that are depended on by the view or procedure. 
	- References to objects outside the current database are not reported.

	
*/
GO

--CREATE DATABASE Sample;
USE Sample
GO


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




-- Create sp with out parameter

CREATE PROCEDURE spGetEmployeeCountByGender
@Gender nvarchar(20),
@EmployeeCount int Output

as

Begin 
	select @EmployeeCount = Count(id)
	from tblEmployee2
	where Gender =@Gender;
End

go



-- EXECUTE SP WITH OUTPUT

DECLARE @EmployeeTotal INT

EXECUTE spGetEmployeeCountByGender 'Male', @EmployeeTotal output

EXECUTE spGetEmployeeCountByGender @EmployeeCount = @EmployeeTotal output, @Gender= 'Male'

PRINT @EmployeeTotal 

go


-- Helpful system store procedure 

--view desciption/information about dbo like sp
sp_help spGetEmployeeCountByGender;
go

--view text/defination of sp
sp_helptext spGetEmployeeCountByGender;
go

--check dependencies of sp
sp_depends spGetEmployeeCountByGender;
go
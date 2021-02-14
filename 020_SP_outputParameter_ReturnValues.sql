/*
	
	RETURN VALUE
	- Whenever we execute a stored procedure,
		- returns an integer status variable.
		- 0 indicate success
		- non- zero indicate failure (NULL)

	- execute using GUI to get return value by default


	- We can fetch count of ID (count(id)),
		- using OUTPUT Parameter as well as RETURN Value.

	- RETURN cannot be used,
		- if return value is other than int data type.
		- if return value more than one
		- ERROR:
			Conversion failed when converting the nvarchar 'Sam' to data type int.
	
	
	
	
	
	
	
	
	
	
	
	
		RETURN VALUE				 			OUTPUT PARAMETER
	1. ONLY INTEGER DATATYPE				1. ANY DATA TYPE
	2. ONLY ONE VALUE						2. MORE THAN ONE VALUE
	3. USE TO CONVEY SUCCESS OR FAILER		3. USE TO RETURN VALUE AS NAME, COUNT, ETC
	
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



-- EXECUTE SP WITH Return value

DECLARE @EmployeeTotal INT,
		@return_value int

EXECUTE @return_value=  spGetEmployeeCountByGender 'Male', @EmployeeTotal output

--select
SELECT	@EmployeeTotal as '@EmployeeCount'

SELECT	'Return Value' = @return_value

go





-- Create sp with Return keyword

Create PROCEDURE spGetEmployeeCountByGender2

as

Begin 
	return (select  Count(id)
			from tblEmployee2
			)
End

go

-- EXECUTE SP WITH Return to get count(id) 

DECLARE @Total INT

EXECUTE  @Total = spGetEmployeeCountByGender2; 

--select
SELECT	@Total as '@EmployeeCount';


go



-- RETURN Concept cannot be used in this situation
-- WE must use OUTPUT Parameter Concept.

--EXECUTE SP WITH Return keyword to get name by id

Create PROCEDURE spGetNameById
@id int
as

Begin 
	return (select NAME
			from tblEmployee2
			where ID = @id
			)
End

go

-- EXECUTE SP WITH Return value

DECLARE @Name INT

EXECUTE  @Name = spGetNameById @id= 1; 

--select
SELECT	@Name as '@EmployeeName';

--ERROR: Conversion failed when converting the nvarchar value 'Tom' to data type int.
go



--EXECUTE SP WITH Return keyword to get name by id

Create PROCEDURE spGetNameById2
@id int,
@Name nvarchar(30) output
as

Begin 
	select @Name=NAME
	from tblEmployee2
	where ID = @id
	
End

go

-- EXECUTE SP WITH Return value

DECLARE @EmployeeName nvarchar(30)

EXECUTE  spGetNameById2 @id= 1, @Name= @EmployeeName output 

--select
SELECT	@EmployeeName as '@EmployeeName';


go
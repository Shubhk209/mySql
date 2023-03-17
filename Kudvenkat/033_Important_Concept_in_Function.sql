/*
	1. Deterministic and Non-Determinstic Function
	2. Encrypting function
	3. Scheme binding function
*/

/*
	1. Deterministic and Non-Determinstic Function
	----------------------------------------------
	Determinstic Function
	- always return the same result any time they are called with a specific set of input values and given the same state of the database.
	
	Example: Square(),Power(),Sum(),AVG() and count()
	
	Note: All aggregate function are determinstic function.


	Non-Determinstic Function
	- may return different result each time they called with a specific set of input values even if the database state that they access remains the same.

	Example: GetDate() and CURRENT_TIMESTAMP

	RAND() FUNCTION
	- NON DETERMINSTIC FUNCTION,
	- but if we provide seed value, the function become the determinsic , as the same value gets returned for the same seed value.

	---------------------------------------------------------------------------------------------------------------------------------------

	2. Encrypting function USING ENCRYPTION OPTION.

	- IT IS SAME AS how we encrypt STORE PROCEDURE TEXT using WITH ENCRYPTION.
	- Along the same lines, we can also encrypt a function text.
	- Once encrypted, we cannot view the text of the function, using sp_helptext system store procedure.
	- We get error if we try to view encrypted text of function:
		--Programmability>Function>Scalar Function> Function_name >(right click)modify
	
		ERROR: The UserDefinedFunction'dbo.[fn_GetEmpolyeeWIthId]' cannot be scripted as its data is not accessible. (Microsoft.SQLServer.Smo)

	----------------------------------------------------------------------------------------------------------------------------------------------


	3. Schemebinding a function
	- Best practice 
	- It specify that the fucntion is bound to the database objects that it references.
	- When schemabinding is specified,
		- the base object (tblPersonDob2) cannot be modified in any way that would affect the function definition.
		
			ERROR: Cannot DROP TABLE 'tblPersonDob2' because it is being referenced by object 'fn_GetEmployeeWithId4'.
	
	- THe function defination itself must first me modified or dropped to remove dependencies on the object that is to be modfied.

	Use WITH SCHEMABINDING

*/
go

--Prerequisite
-- Nvarchar - take 2 length space, so nvarchar(40x2)= 80 length
create table tblPersonDob2 (id int identity,
					Name nvarchar(40),
					DOB datetime,
					Gender nvarchar(10),
					DepartmentID int
					) 

-- Alter the table
--alter table tblPersonDOB2 alter columns Gender nvarchar(15);

--Drop table tblPersonDob2

--sp_help tblPersonDOB2; 

select * from tblpersonDob2; 

insert into tblpersonDob2(Name, DOB, Gender, DepartmentID)
values ('Sam',cast('1986-12-12 00:00:06.267' as datetime),'Male', 1),
		('Radhika',cast('1995-02-10 00:23:06.267' as datetime),'Female', 2),
		('kame',cast('2001-04-10 00:12:06.267' as datetime),'Male', 1),
		('shiv',cast('1996-10-20 00:02:06.267'as datetime),'Male', 1),
		('Rani',cast('1994-11-20 00:02:06.267'as datetime),'Female', 2);	
		
		
select * from tblpersonDob2;
go

----------------------------------------------------------------------------------

-- DETERMINSTIC FUNCTION
select * from tblpersonDob2;

select count(*) from tblPersonDob2;		-- 5 records

SELECT SQUARE(2);		-- 4

GO

--NON-DETERMINSTIC FUNCTION
select GETDATE()	-- 2021-06-07 06:27:08.520, RESULT CHANGE EVERY SECOND

SELECT RAND(1)		--0.713591993212924, ACT AS DETERMINSTIC FUNCTION IF WE PROVIDE IN INPUT SEED.
 
SELECT RAND()		-- RESULT CHANGED EVERY TIME, IT IS NON- DETERMINSTIC IN NATURE.

GO

--------------------------------------------------------------------------------------
------------------Encrypting function USING ENCRYPTION OPTION.------------------------
--------------------------------------------------------------------------------------

Create function fn_GetEmployeeWithId(@id int)
Returns nvarchar(30)		-- 30x2= 60 length(nvarchar)
AS 
BEGIN
	Return (SELECT Name from tblPersonDob2 where Id = @id)
END

go


-- invoke/call the function
select dbo.fn_GetEmployeeWithId(1) 
go

-- WITH ENCRYPTION
Create function fn_GetEmployeeWithId2(@id int)
Returns nvarchar(30)		-- 30x2= 60 length(nvarchar)
WITH ENCRYPTION
AS 
BEGIN
	Return (SELECT Name from tblPersonDob2 where Id = @id)
END


go
-- checking the text
sp_helptext fn_GetEmployeeWithId	-- showing text
sp_helptext fn_GetEmployeeWithId2	-- The text for object 'fn_GetEmployeeWithId2' is encrypted.
go


----------------------------------------------------------------------------------------------------
-------------------------------------------- SCHEMABINDIND------------------------------------------
----------------------------------------------------------------------------------------------------



Create function fn_GetEmployeeWithId3(@id int)
Returns nvarchar(30)		-- 30x2= 60 length(nvarchar)
AS 
BEGIN
	Return (SELECT Name from tblPersonDob2 where Id = @id)
END

go


-- invoke/call the function
select dbo.fn_GetEmployeeWithId(1)		-- Sam
go


-- Droping the table
--DROP table tblPersonDob2
go


-- invoke/call the function
select dbo.fn_GetEmployeeWithId(1)	-- Invalid object name 'tblPersonDob2'.
go

-- to prevent the table to be dropped when it is used by a function. 
-- In such cases we use Schemabinding
go


---- WIth SchemaBinding----

Create function fn_GetEmployeeWithId4(@id int)
Returns nvarchar(30)		-- 30x2= 60 length(nvarchar)
WITH SCHEMABINDING
AS 
BEGIN
	Return (SELECT Name from dbo.tblPersonDob2 where Id = @id)
END

go

/*
	ERROR: Cannot schema bind function 'fn_GetEmployeeWithId4' because name 'tblPersonDob2' is invalid for schema binding. Names must be in two-part format and an object cannot reference itself.
	Reason: We must put 'dbo.' with all table in function which we schemabinding
	Resolve:  Put dbo.tblPersonDob2 in select query to schemabinding.
*/

-- invoke/call the function
select dbo.fn_GetEmployeeWithId(1)		-- Sam
go


-- Droping the table
--DROP table tblPersonDob2		-- Cannot DROP TABLE 'tblPersonDob2' because it is being referenced by object 'fn_GetEmployeeWithId4'.
go

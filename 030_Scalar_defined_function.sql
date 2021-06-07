/*
	User Defined Fucntion (UDF)
	
	3 Types of UDF
	--------------
	1. Scalar Function
	2. Inline table-value function
	3. Multi-statement table-valued functions

	------------------------------------------

	Scalar User Defined Function
	----------------------------
	- takes zero or more parameter
	- but always returns a single scalar value.

	- Return: any data type, EXECPT text, ntext, image, cursor, and timestame etc.

	---------------------------------------------------------------------------------------------------------
	Sytnax:

	CREATE FUNCTION function_name(@parameter1 DataType, @Parameter2 DataType, ... @ParameterN DataType)
	RETURNS return_DataType
	AS
	Begin

		-- Function Body
		return Return_Data_Type
	End
	-----------------------------------------------------------------------------------------------------------
	NOTE:
	TO CHECK ALL SCALAR FUNCTION IN SQL
	- OBJECT EXPLORER > DATABASES > ANY_DATABASE > PROGRAMMABILITY > SCALAR-VALUED FUNCTION > fUNCTION_NAME
	------------------------------------------------------------------------------------------------------------

	Invoking the scalar UDF.
	- when calling a scalar user defined function, you must supply a two-part name,
		- OWNERNAME.FunctionName - dbo stands for Database Owner.

		Select dbo.Age('10/08/1996)

	- We can also invoke it using the 3 complete part name:
		- DatabaseName.OwnerName.function_Name

		Select Sample.dbo.Age('10/08/1996)

	--------------------------------------------------------------------------------------------
	ALTER SCALAR UDF
	
	
	
	
	NOTE: A stored procedure also can accept DateOFBirth and Return AGE, but we cannot use stored procedure in Select or where clause.

*/
GO


--Prerequisite


create table tblPersonDob1 (id int identity,
					Name nvarchar(40),
					DOB datetime 
					) 


select * from tblpersonDob; 

insert into tblpersonDob1(Name, DOB)
values ('Sam',cast('1986-12-12 00:00:06.267' as datetime)),
		('Ram',cast('1995-02-10 00:23:06.267' as datetime)),
		('kame',cast('2001-04-10 00:12:06.267' as datetime)),
		('shiv',cast('1996-10-20 00:02:06.267'as datetime));	
		
		
select * from tblpersonDob1;							 

GO

--SELECT DATEDIFF(YEAR, '1996-10-20 00:00:00.000', GETDATE())
GO

---------------------------------------------------------------
-- Create a scalar function to compute the age of the person.--
---------------------------------------------------------------
CREATE FUNCTION CalculateAge(@DOB Date)
RETURNS INT
AS 
BEGIN
	DECLARE @AGE INT

	SET @AGE = DATEDIFF(YEAR, @DOB, GETDATE()) -
		CASE
			WHEN MONTH(@DOB) > MONTH(GETDATE()) OR
			MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())
			THEN 1
			ELSE 0
		END

	RETURN @AGE
	
END

--NOTE:
--	TO CHECK ALL SCALAR FUNCTION IN SQL
--	- OBJECT EXPLORER > DATABASES > ANY_DATABASE > PROGRAMMABILITY > SCALAR-VALUED FUNCTION > fUNCTION_NAME
GO

-- INVOKE THE FUNCTION 
--iNPUT OCTOBER , 20 , 1996

SELECT CalculateAge('10/20/1996')		-- error: 'CalculateAge' is not a recognized built-in function name.


SELECT dbo.CalculateAge('10/20/1996') as AGE ;	-- 24

SELECT Sample.dbo.CalculateAge('10/20/1996') as AGE ;	-- 24

go


-- Scalar user defined function can be used in Select clause.

select *, dbo.CalculateAge(DOB) as AGE from tblPersonDob; 


-- Scalar user defined function can be used in Select Where clause.

select *, dbo.CalculateAge(DOB) as AGE from tblPersonDob 
where dbo.CalculateAge(DOB) > 20

-- A stored procedure also can accept DateOFBirth and Return AGE, but we cannot use stored procedure in Select or where clause.
GO


---------------------------------------------------------------
-- Create a STORE PROCEDURE to compute the age of the person.--
---------------------------------------------------------------
CREATE PROCEDURE CalAge
@DOB Date
AS 
BEGIN
	DECLARE @AGE INT

	SET @AGE = DATEDIFF(YEAR, @DOB, GETDATE()) -
		CASE
			WHEN MONTH(@DOB) > MONTH(GETDATE()) OR
			MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())
			THEN 1
			ELSE 0
		END

	SELECT @AGE
	
END

-- CHECK ALL USER DEFINE STORE PROCEDURE
-- OBJECT EXPLORER > DATABASES > ANY_DATABASE > PROGRAMMABILITY > STORE PROCEDURES> STORE_PROCEDURES_NAME
GO


-- INVOKE STORE PROCEDURE
EXEC CalAge '10/20/1996'			-- 24
GO


------------------------------------------------------------
--------------- ALTER A FUNCTION----------------------------
------------------------------------------------------------
ALTER FUNCTION CalculateAge(@DOB Date)
RETURNS FLOAT
AS 
BEGIN
	DECLARE @AGE INT

	SET @AGE = DATEDIFF(YEAR, @DOB, GETDATE()) -
		CASE
			WHEN MONTH(@DOB) > MONTH(GETDATE()) OR
			MONTH(@DOB) = MONTH(GETDATE()) AND DAY(@DOB) > DAY(GETDATE())
			THEN 1
			ELSE 0
		END

	RETURN @AGE
	
END

-- CHECK ALTER FUNCTION
 sp_helptext CalculateAge

 sp_help CalculateAge

go


-------------------------------------------------------
---------------Drop the scalar function ---------------
-------------------------------------------------------

DROP FUNCTION CalculateAge

go
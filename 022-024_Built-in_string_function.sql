/*
	Function
	- Set of sql statement which add-on to the SQL queries.

	Types of Function
	1. System defined functions (Built-in).
	- Pre-defined by microsoft

		Types of System Functions:
		1. Single value system define function
		- These work row by row 
			- means  take one row as value and does operation, again take a row/ value and does operation.
		- Example: String, Date,...etc functions.

		2.Group\Multi-value sytem define function
		- Take multiple values or row and does a operation.
			- works on muliple rows
		- Aggregate Function: SUM(),MAX(),MIN(),AVG(),COUNT().

	2. User Defined Function
	- Function which are define by users.

----------------------------------------------------------------------------------------------------------
	
	TO FIND ALL THE SYSTEM FUNCTION IN ONJECT EXPLORER.
	- DATABASES > DATABASE_NAME > PROGRAMMABILITY > FUNCTION > SYSTEM FUNCTION
-------------------------------------------------------------------------------------------------------	
	STRING FUNCTION
	- TAKE / WORK ON STRING FUNCTION.

	1. ASCII(CHAR_VARCHAR)
	- RETURNS THE ASCII CODE OF THE GIVEN CHARACTER EXPRESSION.
	- PARAMETER : CHAR OR VARCHAR
	- RETURN : INT

	NOTE: IF WE PASS MULIIPLE CHARACTER AS PARAMETER,
			- RETURN THE ASCII CODE OF FIRST CHARACTER.

	2. CHAR(ASCII_INT_VALUE)
	- CONVERT AN INT ASCII TO A CHARACTER.
	- PARAMETER: INT
	- RETURN :  CHAR


	3. LTRIM(CHAR_VARCHAR)
	- REMOVE BLANKS/ EMPTY SPACE ON THE LEFT HANDSIDE OF THE GIVEN CHARACTER EXPRESSTION.
	- PARAMETER: CHAR OR VARCHAR
	- RETURN : CHAR OR VARCHAR



	4. REVERSE(' ANY_STRING')
	- REVERSE ALL THE CHARACTER IN THE GIVEN EXPRESSION.
	- PARAMETER: VARCHAR
	- RETURN: VARCHAR

	
	5. LEN()
	-  RETURN THE NUMBER OF CHARACTER IN STRING.
		- include blank space at begining of string
		- exclude blank spaces at end of the string.

	- PARAMETER: CHAR OR VARCHAR
	- RETURN : INT



	6. LOWER(VARCHAR)
	- CONVERT ALL CHARACTER TO UPPER CASE.
	- PARAMETER:  CHAR OR VARCHAR
	- RETURN: CHAR OR VARCHAR

	7. UPPER(VARCHAR)
	- CONVERT ALL CHARACTER TO LOWER CASE.
	- PARAMETER: CHAR OR VARCHAR
	- RETURN : VARCHAR

	8. LEFT('VARCHAR', INT)
	- RETURN THE SPECIFIED NUMBER OF CHARACTER FROM THE LHS OF STRING.
	- PARARMETER:	VARCHAR
					INT
	
	- RETURN:	VARCHAR

	9. RIGHT('VARCHAR', INT)
	- RETURN THE SPECIFIED NUMBER OF CHARACTER FROM THE RHS OF STRING.
	- PARARMETER:	VARCHAR
					INT
	
	- RETURN:	VARCHAR


	10. CHARINDEX('EXPRESSION TO FIND', 'EXPRESSION_To_Search', 'Start_Location')
	- RETURN THE STARTING POSITION OF THE SPECIFIED EXPRESSION IN A CHARACTER STRING.
	- FIND THE INDEX POSITION OF GIVEN CHARACTER IN STRING.
	- PARAMETER:	CHAR OR VARCHAR
					VARCHAR
					INT

	- RETURN:	INT


	11. SUBSTRING('EXPRESSION', 'START', LENGTH)
	- RETURN SUBSTRING (PART OF THE STRING), FROM THE GIVEN EXPRESSION.
	- PARAMETER: VARCHAR
				INT (Starting index)
				INT (len_of_string)

	- RETURN: VARCHAR


	12. REPLICATE('string_to_be_replicated', number_of_time_to_replicate)
	- REPEAT THE GIVEN STRING, FOR THE SPECIFIED NUMBER OF TIMES.
	- PARAMETER:	VARCHAR
					INT
	-RETURN: VARCHAR


	13. SPACE()
	- RETURN NO OF SPACES SPECIFIED BY PARAMETER
	-PARAMETER: INT
	- RETURN : NVARCHAR (AS SPACE)


	14.  PATINDEX
	- Return the starting postion of the first occurance of a pattern in a specified expression.
		- it is similar to CHARINDEX(cannot use Wild Card{%, [],..etc}).
		- we can use wild card in patindex.
		- if patten not found return 0.
	- PARAMETER:	Varchar (pattern_to_search)
					Varchar (Main String)
	- RETURN : int


	15. Replace()
	- replace all occurances of a specified string value with another string value.
	- Parameter :	Varchar (Main_string_expression)
					Varchar (pattern)
					Varchar (replacement_value)
	- Return : varchar
	
	

	16. Stuff('Main_String', start_index, string_length,Replacement_expression)
	- it insert Replacement_expression,
		- at the start_index position specified,
		- along with removing the character specified using Length_parameter.
	- Parameter :	Varchar (Main_string_expression)
					int		(start index)
					int		(length_)
					Varchar (replacement_value)
	- Return : varchar

	 




*/

GO

--PREREQUISTIC
CREATE DATABASE Sample;

use sample;

create table tblpersonDetails	(Id int ,
								 FirstName varchar(30),
								 LastName  varchar(30),
								 Email nvarchar(60),
								 constraint pk_personDetails primary key(Id)
								 );

insert into tblpersonDetails (Id, FirstName,LastName, Email)
values	(1,'Sam','Sony','Sam@aaa.com'),
		(2,'Ram','Barber','Ram@aaa.com'),
		(3,'Sara','Sanosky','Sara@ccc.com'),
		(4,'Todd','Gartner','Todd@bbb.com'),
		(5,'John','Grover','John@aaa.com'),
		(6,'Sana','Lenin','Sana@ccc.com'),
		(7,'James','Bond','James@bbb.com'),
		(8,'Rob','Hunter','Rob@ccc.com'),
		(9,'Steve','Wilson','Streve@aaa.com'),
		(10,'Pam','Broker','Pam@bbb.com');
		


Select * from tblpersonDetails;


-- 1. ASCII FUNCTION

SELECT ASCII('a');		-- 97
SELECT ASCII('A');		-- 65

SELECT ASCII('a') - ASCII('A');	--32

SELECT ASCII('ABC');		--65
SELECT ASCII('abc');		--97

GO

--2. CHAR FUNCTION

SELECT CHAR(65);			--A
SELECT CHAR(97);			--a


-- PRINT A-Z ALPHABET

DECLARE @Start int
set @Start = 65

while(@Start <= 90)
	Begin
		Print Char(@start)
		set @Start += 1
	end

GO


--3. LTRIM FUNCTION
SELECT '     HELLO';		--     HELLO
SELECT LTRIM('      HELLO');	--HELLO

GO


--4. RTRIM FUNCTION

SELECT 'HELLO       ' + 'WORLD';		--HELLO       WORLD

SELECT RTRIM('HELLO     ') + ' ' +('WORLD');	--HELLO WORLD
GO


--5. REVERSE

SELECT REVERSE('TRAIN');	--NIART

SELECT REVERSE('BUS');		--SUB
GO



--6. LEN FUNCTION

SELECT LEN('TRAIN');	--5

SELECT LEN('SDKFJSAFJLKSJFLKJDSFLJ');	--22

GO



--7. UPPER FUNCTION

SELECT UPPER('shubham');	--SHUBHAM
GO


--8. LOWER FUNCTION

SELECT LOWER('SHUBHAM');	--shubham
go
 


--9. LEFT FUNCTION
SELECT LEFT('SAM@AAA.COM',3);		--SAM
GO

--10. RIGHT FUNCTION	

SELECT RIGHT('SAM@AAA.COM',3);		--COM
GO



--11. CHARINDEX FUNCTION

SELECT CHARINDEX('@','SARA@AAA.COM', 1);	--5

--12. SUBSTRING FUNCTION
SELECT SUBSTRING('SARA@AAA.COM', 6,7);		--AAA.COM

select SUBSTRING('SARA@AAA.COM', Charindex('@','SARA@AAA.COM'), Len('SARA@AAA.COM'));	--@AAA.COM




-- FIND EMAIL DOMAIN AND NO OF EMPLOYEE WITH THOSE DOMAIN.

SELECT SUBSTRING(Email, CHARINDEX('@',Email), Len(Email)) as Domain, Count(*) as total
from tblpersonDetails
group by SUBSTRING(Email, Charindex('@',Email), Len(Email));

GO


-- 13. REPLICATE FUNCTION

SELECT REPLICATE('PRAGRIM ', 3);			--PRAGRIM PRAGRIM PRAGRIM 

SELECT REPLICATE('PRAGRIM'+SPACE(1), 3);	--PRAGRIM PRAGRIM PRAGRIM 


--MASK THE EMAIL  
SELECT	ID, FirstName, LastName, 
		SUBSTRING(EMAIL,1,2) + REPLICATE('*',5) +
		SUBSTRING(Email, CHARINDEX('@',Email),len(Email))
FROM tblpersonDetails

GO


--14. SPACE FUNCTION

SELECT FirstName + SPACE(1)+ LastName AS [FULL NAME]
FROM tblpersonDetails
GO


-- 15. PATINDEX FUNCTION

-- SEARCH FOR PATTERN AND ITS INDEX POSITION

select * from tblpersonDetails

SELECT Email, PATINDEX('%@aaa.com', Email) as [FirstOccurance]
FROM tblpersonDetails
where PATINDEX('%@aaa.COM', Email) > 0;

go


--16. Replace Function


-- replace .com domain with .net in Emial
SELECT Email, REPLACE(Email,'.com','.net') as ConvertedEmail
FROM tblpersonDetails;
go


--17. Stuff function

SELECT Email, STUFF(Email,2,3,'*****') as ConvertedEmail
FROM tblpersonDetails;
go


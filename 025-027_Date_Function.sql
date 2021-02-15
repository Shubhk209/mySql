/*
	Date Datatype
	
	1. time
	- FORMAT:	hh:mm:ss[.nnnnnnn]
	- SIZE:		3-5 bytes
	- Accuracy:	100 nanoseconds

	2. date 
	- FORMAT:	YYYY-MM-DD
	- SIZE:		3 bytes
	- Accuracy:	1 day

	3. smalldatetime
	- FORMAT:	YYYY-MM-DD hh:mm:ss
	- SIZE:		4 bytes
	- Accuracy:	1 min

	4. datetime
	- FORMAT:	YYYY-MM-DD hh:mm:ss[.nnn]
	- SIZE:		8 bytes
	- Accuracy:	0.00333 sec

	5. datetime2
	- FORMAT:	YYYY-MM-DD hh:mm:ss[.nnnnnnn]
	- SIZE:		6-8 bytes
	- Accuracy:	0.00333 sec

	6. datetimeoffset (UTC)
	- FORMAT:	YYYY-MM-DD hh:mm:ss[.nnnnnnn] [+|-]hh:mm
	- SIZE:		8 to 10 bytes
	- Accuracy:	0.00333 sec

-----------------------------------------------------------------------------
	UTC
	- Coorinated Universal Time (World stand time:)
		- based o which the world regulates clocks and time.(Central time)
	- UTC is synonymous with GMT
-----------------------------------------------------------------------------
	
	DATETIME FUNCTION

	1. GETDATE()
	- USED TO GET CURRENT SYSTEM DATE AND TIME
	
	- Returns the current database system timestamp as a datetime value without the database time zone offset. 
	
	- This value is derived from the operating system of the computer on which the instance of SQL Server is running.

	- Example: 2021-02-03 00:18:00.657

	
	
	2. CURRENT_TIMESTAMP
	- ANSI SQL EQUIVALENT TO 
	
	- Returns the current database system timestamp as a datetime value, without the database time zone offset. 
	
	- It derives this value from the operating system of the computer on which the instance of SQL Server runs.

	- Example: 2021-02-03 00:22:06.267


	
	
	3. SYSDATETIME()
	- USED TO GET CURRENT SYSTEM DATE AND TIME WITH MORE FRACIONAL SECOND PRECISION.

	- Example: 2021-02-03 00:24:50.5359955

	
	
	4. SYSDATETIMEOFFSET()
	- USED TO GET CURRENT SYSTEM DATE AND TIME WITH MORE FRACIONAL SECOND PRECISION AND OFFSET.
	
	- Returns a datetimeoffset(7) value that contains the date and time of the computer 
		- on which the instance of SQL Server is running. 
	
	- The time zone offset is included. 
	
	- Example: 2021-02-03 00:28:48.0734646 +05:30
	
	
	5. GETUTCDATE()
	- Returns the current database system timestamp as a DATETIME value. 
		- The database time zone offset is not included. 
			- This value represents the current UTC time (Coordinated Universal Time). 
	
	-This value is derived from the operating system of the computer on which the instance of SQL Server is running.
	
	- Example: --2021-02-02 19:00:35.710
	
	
	
	6. SYSUTCDATETIME
	- Returns a DATETIME2 value that contains the date and time of the computer on which the instance of SQL Server is running. 
		- The date and time is returned as UTC time (Coordinated Universal Time). 
			- The fractional second precision specification has a range from 1 to 7 digits. 
				-The default precision is 7 digits.
	
	- Example: 2021-02-02 19:01:51.9079895
-------------------------------------------------------------------------------------------------------------------------------------
	7. ISDATE()
	- check if the given value is date, time or datetime 
	- return 1 for success(true)
	- return 0 for failure (false)

	Note: for datetime2, ISDATE() returns ZERO(0).


	8. DAY()
	- Return the 'day number of the month' of the given date.

	- Example: SELECT DAY('2021-02-03 00:22:06.267')		--3 (Date)


	9. Months()
	- Returns the 'Month Number' of the year of the given date.
	
	-- Example: SELECT DAY('2021-02-03 00:22:06.267')		--2 (month)
	
	
	
	10. Year()
	- Return the 'year number' of given date.

	-- Example: SELECT DAY('2021-02-03 00:22:06.267')		--2021 (YEAR)
	
	
	11. DATENAME
	- RETURN A STRING 
		- THAT REPRESENT A PART OF THE GIVEN DATE.
	
	- PARAMETER:	DATEPART	(LIKE DAY, WEEKEND, MONTH...)
					DATE		(LIKE 2021-02-03 00:22:06.267)

	RETURN: NVARCHAR

	12. DATEPART()
	- RETURN AN INTEGER REPRESENTING THE SPECIFIED DATEPART.
	- THIS FUNCTION IS SIMILAR TO DATENAME()
	- DATENAME() RETURNS NVARCHAR.
	
	- PARAMETER:	DATEPART	(LIKE DAY, WEEKEND, MONTH...)
					DATE		(LIKE 2021-02-03 00:22:06.267)

	- RETURN:		INT


	12. DATEADD()
	- RETURNS THE DATETIME,
		- AFTER ADDING SPECIFIED NumberOfDays,
			- TO THE DatePart specified of the given date.

	- PARAMETER:	DATEPART	(LIKE DAY, WEEKEND, MONTH...)
					NoOfDays	(Like 10,12,20 ... any no of days to add)
					DATE		(LIKE '2021-02-03 00:22:06.267')

	- RETURN:		datetime


	
	13. DATEDIFF(Datepart,startdate, enddate)
	- Return the count of the specfied datepart boundaries crossed between the specified startdate and end date.
	-  

	- PARAMETER:	DATEPART	(LIKE DAY, WEEKEND, MONTH...)
					startdate	(LIKE '2020-02-03 00:22:06.267')
					enddate		(LIKE '2021-01-25 00:22:06.267')

	- RETURN:		datetime





					

*/
go


--CREATE DATABASE Sample;
Use Sample;
go



--Prerequisite

Create table tblDateTime	(c_time time,
							 c_date date,
							 c_smalldatetime smalldatetime,
							 c_datetime datetime,
							 c_datetime2 datetime2,
							 c_datetimeoffset datetimeoffset
							);

INSERT INTO tblDateTime (c_time,c_date,c_smalldatetime,c_datetime,c_datetime2,c_datetimeoffset)
VALUES (GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE());

SELECT * FROM tblDateTime;


--FOR DATENAME
--Use Sample
create table tblPersonDob (id int identity,
					Name nvarchar(40),
					DOB datetime 
					) 


select * from tblpersonDob; 

insert into tblpersonDob(Name, DOB)
values ('Sam',cast('1986-12-12 00:00:06.267' as datetime)),
		('Ram',cast('1995-02-10 00:23:06.267' as datetime)),
		('kame',cast('2001-04-10 00:12:06.267' as datetime)),
		('shiv',cast('1996-10-20 00:02:06.267'as datetime));	
		
		
select * from tblpersonDob;							 

GO



--OFFSET IS NOT GIVEN BY GETDATE()
SELECT GETDATE();

UPDATE tblDateTime SET c_datetimeoffset ='2021-02-03 00:04:13.9670000 +05:30'
WHERE c_datetimeoffset = '2021-02-03 00:04:13.9670000 +00:00';

-- IT IS NOT POSSIBLE TO STORE OFFSET INTO DATETIME AND DATETIME2
go

/*	DATETIME FUNCTIONS	*/

--1.GETDATE()
SELECT GETDATE();			--2021-02-03 00:23:47.460
GO

--2. CURRENT_TIMESTAMP()
SELECT CURRENT_TIMESTAMP;	--2021-02-03 00:22:06.267
GO


--3. SYSDATETIME()
 SELECT SYSDATETIME();		--2021-02-03 00:24:50.5359955


 --4. SYSDATETIMEOFFSET()

SELECT SYSDATETIMEOFFSET();	--2021-02-03 00:28:48.0734646 +05:30	
GO

--5. GETUTCDATE()
SELECT GETUTCDATE();		--2021-02-02 19:00:35.710
GO

--6. SYSUTCDATETIME()
SELECT SYSUTCDATETIME();	--2021-02-02 19:01:51.9079895
GO

------------------------------------------------------------------------

--7. DATE()

--PASS STRING
SELECT ISDATE('PRAM');								-- RETURN 0

--PASS SYSTEM DATE AND TIME
SELECT ISDATE(GETDATE());							-- RETURN 1

-- PASS DATETIME VALUE
SELECT ISDATE('2021-02-03 00:00:45.730');			-- RETURN 1 

-- PASS DATETIME2 VALUE
SELECT ISDATE('2021-02-03 00:00:45.730');			-- RETURN 0
GO


--8. Day

--PASS SYSTEM DATE AND TIME (2021-02-03 15:29:41.670)

SELECT day(GETDATE());			-- 3

-- PASS DATETIME2 VALUE
SELECT DAY('2020-02-12 00:00:45.730');		--12

go




--9. Month()

--PASS SYSTEM DATE AND TIME (2021-02-03 15:29:41.670)

SELECT MONTH(GETDATE());			-- 2

-- PASS DATETIME2 VALUE
SELECT DAY('2020-10-12 00:00:45.730');		--10
go



--10. Year()
--PASS SYSTEM DATE AND TIME (2021-02-03 15:29:41.670)

SELECT Year(GETDATE());			-- 2021

-- PASS DATETIME2 VALUE
SELECT Year('2020-10-12 00:00:45.730');		--2020
go


-- 11. DateName(DatePart, 'date')

SELECT DateName(Day,'2020-10-12 00:00:45.730');			--12 
SELECT DateName(MONTH,'2020-10-12 00:00:45.730');		-- October 
SELECT DateName(YEAR,'2020-10-12 00:00:45.730');		-- 2020
SELECT DateName(WEEKDAY,'2020-10-12 00:00:45.730');		--monday
SELECT DateName(DAYOFYEAR,'2020-10-12 00:00:45.730');	--286
SELECT DateName(QUARTER,'2020-10-12 00:00:45.730');		--4
SELECT DateName(HOUR,'2020-10-12 00:00:45.730');		-- 0 (12 am)
SELECT DateName(WEEK,'2020-10-12 00:00:45.730');		-- 42


--Find the Day, Month Number and Name With year using DATENAME
select	Name, [DOB],DATENAME(weekday,[DOB]) as Day,
		MONTH(DOB) as [Month Number], 
		DATENAME(month, [DOB]) as [Month Name],
		YEAR(DOB) as [Year]
from tblpersonDob

go

-- 12. DatePart(Datepart, 'date')

SELECT Datepart(WEEKDAY,'2020-10-12 00:00:45.730');		--2 (1 for sunday, 2 for monday)
SELECT DateName(WEEKDAY,'2020-10-12 00:00:45.730');		--monday


SELECT DatePart(Day,'2020-10-12 00:00:45.730');			--12 
SELECT DatePart(MONTH,'2020-10-12 00:00:45.730');		-- 10 
SELECT DatePart(YEAR,'2020-10-12 00:00:45.7300');		-- 2020
SELECT DatePart(DAYOFYEAR,'2020-10-12 00:00:45.730');	--286
SELECT DatePart(QUARTER,'2020-10-12 00:00:45.7300');		--4
SELECT DatePart(HOUR,'2020-10-12 00:00:45.730');		-- 0 (12 am)
SELECT DatePart(WEEK,'2020-10-12 00:00:45.730');		-- 42

go



--13. DATEADD(DATEPART, NumberToAdd, 'date')

SELECT DATEADD(YEAR, 1 , '2020-10-12 00:00:45.730');		--2021-10-12 00:00:45.730
SELECT DATEADD(MONTH, 1 , '2020-10-12 00:00:45.730');		--2020-11-12 00:00:45.730

SELECT DATEADD(DAY, 20 , '2020-10-12 00:00:45.730');	--2020-11-01 00:00:45.730
SELECT DATEADD(DAY, -20 , '2020-10-12 00:00:45.730');	--2020-09-22 00:00:45.730
go

--13. DATEDIFF(DATEPART, startdate, enddate)

SELECT DATEDIFF(MONTH, '2020-10-12 00:00:45.730','2021-10-05 00:00:45.730');		--12 months
SELECT DATEDIFF(DAY, '2020-10-12 00:00:45.730','2021-10-05 00:00:45.730');			--358 days

SELECT DATEDIFF(WEEK, '2020-10-12 00:00:45.730','2021-10-05 00:00:45.730');			--51 weeks

go


------------------------------------------------------------------------------------------------------
--Calculate Age

/*
	1. Inputs
		Current Date(CDT): 	01-31-2020	(MM-DD-YYYY)
		Birthday(DOB):		11-30-2019	(MM-DD-YYYY)
	
	2. @Year= (CDT_Year(2020) - (DOB_Year(2019))) - 1, 
						if DOB_Month(30)  > CDT_Month(31)								--(true)Year subtract by 1
						OR
						if ((DOB_Month equals to CDT_Month) AND (DOB_Day > CDT_Day)		--(true)Year subtract by 1

						else (CDT_Year(2020) - (DOB_Year(2019))) - 0
	
	2.@temp = DateAdd @YEAR 
	
	3. @Months = (CDT_Months(31) - (DOB_Months(30)) - 1, 
							if DOB_Days > CDT_Days		-- (true)CDT_Months subtract by 1

							else (CDT_Months(31) - (DOB_Months(30)) - 0

	4. @temp = DateAdd @months 
	 
	5  @days= CDT_day()- DOB_days(30)

	6 . print @year @months @days
	
*/GO


-- declare variables
DECLARE @Input_DOB datetime, @tempDate datetime, @year int, @months int , @days int

--assign of DOB date
SET @Input_DOB = '10-20-1996'

-- create a copy of Input_DOB value in Tempdate variable
SELECT @tempdate = @Input_DOB

--TESTING PURPOSE
SELECT @tempDate AS [bEFORE YEAR SUBTRACT]

SELECT @year = DATEDIFF(YEAR, @tempDate, GETDATE()) - 
				CASE 
					WHEN	( MONTH(@Input_DOB) > MONTH(GETDATE()) )  
							OR
							( MONTH(@Input_DOB) = MONTH(GETDATE()) AND DAY(@Input_DOB) > DAY(GETDATE())) 
							THEN 1 ELSE 0
					END

-- ASSIGN 1 0R O TO TEMPDATE
SELECT @tempDate =  DATEADD(YEAR, @YEAR, @tempDate)

--TESTING PURPOSE
SELECT @tempDate AS [AFTER YEAR SUBTRACT]

--SUBTRACT MONTHS
SELECT @months = DATEDIFF(MONTH, @tempDate,GETDATE()) -
				CASE
					WHEN DAY(@Input_DOB) > DAY(GETDATE())
					THEN 1 ELSE 0
				END

SELECT @tempDate= DATEADD(MONTH, @months , @tempDate)

--TESTING PURPOSE
SELECT @tempDate AS [AFTER mONTHS SUBTRACT]

SELECT @days = DATEDIFF(DAY, @tempDate, GETDATE())

SELECT @tempDate AS [AFTER dAYS SUBTRACT]

SELECT @year AS [YEARS], @months AS [MONTH],  @days AS [DAY] 


GO







----------------------------------------------------------------------------
-- Create Function TO CALCULATE DATE OF BIRTH


create FUNCTION fnComputeAge(@input_DOB datetime)
RETURNS NVARCHAR(50)

AS

BEGIN

DECLARE @tempDate datetime, @year int, @months int , @days int



-- create a copy of Input_DOB value in Tempdate variable
SELECT @tempdate = @Input_DOB


SELECT @year = DATEDIFF(YEAR, @tempDate, GETDATE()) - 
				CASE 
					WHEN	( MONTH(@Input_DOB) > MONTH(GETDATE()) )  
							OR
							( MONTH(@Input_DOB) = MONTH(GETDATE()) AND DAY(@Input_DOB) > DAY(GETDATE())) 
							THEN 1 ELSE 0
					END

-- ASSIGN 1 0R O TO TEMPDATE
SELECT @tempDate =  DATEADD(YEAR, @YEAR, @tempDate)


--SUBTRACT MONTHS
SELECT @months = DATEDIFF(MONTH, @tempDate,GETDATE()) -
				CASE
					WHEN DAY(@Input_DOB) > DAY(GETDATE())
					THEN 1 ELSE 0
				END

SELECT @tempDate= DATEADD(MONTH, @months , @tempDate)



SELECT @days = DATEDIFF(DAY, @tempDate, GETDATE())

	DECLARE @Age NVARCHAR(50)
	SET @Age = Cast(@year as nvarchar(5)) + ' Years' + cast(@months as nvarchar(2)) +' Months'+ Cast(@Days as nvarchar) + ' Days Old.'

	return @Age

END



-- call the function (mm-dd-yy)

select dbo.fnComputeAge('10-20-1996')

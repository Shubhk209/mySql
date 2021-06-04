/*
	TO CONVERT ONE DATA TO ANOTHE, CAST AND CONVERT FUNCTION CAN BE USED.


	SYNTAX OF CAST AND CONVERT FROM MSDN:
	-------------------------------------

		1. CAST(expression AS data_type[(length)])
			- expression:	current data we have
			- data_type:	target datatype we want to convert into
			- length is opitinal.
			

		EX: CAST (GETDATE() AS nvarchar)


		NOTE:
		----------------------------------------------------------------
		2. CONVERT(data_type[(length)],expression [, style])
			- data_type:	target datatype we want to convert into
			- length is opitinal.
			- expression:	current data we have
			- style : DateFormat (like 103 --> dd/mm/yyyy)
		
		EX: CONVERT(nvarchar, GETDATE() ,103)


		------------------------------------------------------------------------------------------------------
		DATE FORMAT

		STYLE			DATEFORMAT
		101				mm/dd/yyyy								SELECT CONVERT(VARCHAR(10), GETDATE(), 101) AS [MM/DD/YYYY]
		102				yy.mm.dd
		103				dd/mm/yyyy
		104				dd.mm.yy
		105				dd-mm-yy
		
		121				yyyy-mm-dd hh:mi:ss.mmm(24h)			SELECT CONVERT(VARCHAR(23), GETDATE(), 121)

		link: msdn.microsoft.com/en-us/library/ms187928.aspx
		------------------------------------------------------------------------------------------------------
*/



-- Prerequisite
--Use Sample
create table tblPersonDob (Id int identity,
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
go



-- cast dateofBirth to nvarchar from table tblPersonDOB

select id, Name, DOB, CAST(DOB as nvarchar) as ConvertedDOB
from tblPersonDOB;

--Output
--1	Sam		1986-12-12 00:00:06.267		Dec 12 1986 12:00AM
--2	Ram		1995-02-10 00:23:06.267		Feb 10 1995 12:23AM
--3	kame	2001-04-10 00:12:06.267		Apr 10 2001 12:12AM
--4	shiv	1996-10-20 00:02:06.267		Oct 20 1996 12:02AM	

go	


--Convert dateofBirth to nvarchar from table tblPersonDOB

select id, Name, DOB, CONVERT(nvarchar,DOB, 103) as ConvertedDOB
from tblPersonDOB;

--Output
--1	Sam		1986-12-12 00:00:06.267		12/12/1986
--2	Ram		1995-02-10 00:23:06.267		10/02/1995
--3	kame	2001-04-10 00:12:06.267		10/04/2001
--4	shiv	1996-10-20 00:02:06.267		20/10/1996
go
/*
	COALESCE() FUNCTION
	-  Returns the first non-null value in a list.
	- Syntax
		
		COALESCE(val1, val2, ...., val_n)
	
	- EXAMPLE:
		SELECT COALESCE(NULL, 1, 2, 'W3Schools.com');
*/
go



-- create database [Sample]

--use Sample
go

create table tblPersonName	(Id int identity,
							 FirstName nvarchar(30),
							 MiddleName nvarchar(30),
							 LastName nvarchar(30)
							 );  

insert into tblPersonName (FirstName,MiddleName,LastName)
values	('Sam',NULL,NULL),
		(NULL,'Todd','Tanzan'),
		(NULL,NULL,'Sara'),
		('Ben','Parker',NULL),
		('James','Nick','Naresh');	


select * from tblPersonName;
go



select Id,COALESCE(FirstName,MiddleName,LastName) as Name
From tblPersonName;


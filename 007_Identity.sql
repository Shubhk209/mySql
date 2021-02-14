/*

	IDENTITY
	-If a column is marked as an identity column,
		- then the values for this column are automatically generated.
		- When you insert a new row into the table.

	Identity(seed, increment)
	- seed: initial value. 
	- Increment: increment by given value. 


	TO EXPLICITLY SUPPLY A VALUE FOR IDENTITY COLUMN
	1. First turn ON 'IDENTITY_INSERT' 
		- SET IDENTITY_INSERT <TABLE_NAME> ON

	2. In the insert query specify the column list
		- insert into <Table_Name> (column_name1, ...)
		  values (value1, ...);
	
	
	
	
	TO RESET THE IDENTITY,
	- IN CASE IF WE DELETE ALL DATA FROM TABLE

		DBCC CHECKIDENT('<TBLNAME>',RESEED,0);
	
	
	
	
	GUI mode to Add Identity to column
	- Column properties \ Table designer \ identity specification [+] \ [is identity] (yes)
*/

USE [Sample]
GO

CREATE TABLE tblPerson2	(Id int NOT NULL primary key identity(1,1),
						 Name varchar(30) NOT NULL,
						 Email varchar(50) NOT NULL,
						 GenderId int,
						 Age int
						 foreign key (GenderId) references tblGender(ID) 
						);

--ALTER TABLE tblPerson2 alter column Name varchar(100);
--ALTER TABLE tblPerson2 alter column Email varchar(100);

INSERT INTO tblPerson2 (Id,Name,Email,GenderId,Age) 
values (1,'John','j@j.com',null,null),
		(2,'Ron','r@r.com',1,null),
		(3,'Rich','ri@ri.com',null,null);


select * from tblPerson2;
go


--add identity to id column in existing table
ALTER TABLE tblPerson2
ADD PRIMARY KEY (Id); 

ALTER TABLE
  tblPerson2
ADD
  Id int IDENTITY(1, 1) NOT NULL;
 
 GO

select * from tblPerson2;

-- remove person data from table whose id is 1.
Delete from tblPerson2 where id = 1;

-- to insert (explicitly)custom id value in table with identity contraint enabled;
	-- we need to follow 2 condition
	-- 1. IDENTITY_INSERT is ON
	-- 2. specify the column list while inserting.

SET IDENTITY_INSERT tblPerson2 ON

insert into dbo.tblPerson2 (Id,Name,Email,GenderId,Age) values (1,'John','j@j.com',null,null);

select * from tblPerson2;
go


--To insert new record in tblPerson2 with implicit identity value, 
	--we need to disable IDENTITY_INSERT tblPerson2 OFF  
	--otherwise it shows ERROR.

SET IDENTITY_INSERT tblPerson2 OFF

--insert new record
insert into dbo.tblPerson2 (Id,Name,Email,GenderId,Age) values ('John','j@j.com',null,null);
go


--RESET IDENTITY (Used when we remove all data from table in which a column has identity constraint enable).

DBCC CHECKIDENT('tblPerson',RESEED,0);
GO

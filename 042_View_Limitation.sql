/*
	View Limitation

	1. We cannot pass parameters to view. Tables Valued functions are an excellent replacement for parameterized view.
		-- parameterized view cannot be created to fetch record by filtering.
		-- We can Filter Gender in the where clause 
	1.2 We can create Inline Table valued function as a replacement for Parameterized View(which we cannot create)

	2. Rules and Defaults cannot be associated with Views.
		-- because views are virtual tables and dont store any data except for indexed views.

	3. Order By clause is invalid in the views unless TOP or FOR XML is also specified.
	
	4. View cannot be based on temporary tables.
		-- we cannot create a view on temp table

*/


--Prerequisite
create database Test
go

use test

Create TABLE tblEmployeeDetails (	Id int IDENTITY(1,1) primary key ,
									[Name] nvarchar(20),
									salary int, 
									Gender nvarchar(10),
									DepartmentId int
									)

-- drop table tblEmployeeDetails
-- ALTER TABLE tblEmployeeDetails ADD NewColumn INT IDENTITY(1,1)

--insert into tblEmployeeDetails (Name,salary,Gender,DepartmentId)values ('shubham',5000,'Male',3),
																		('shivam',null,'Male',2),
																		('shivani',4000,'Female',3),
																		('Nikhil',5100,'Male',4),
																		('Hemant',3500,'Male',1),
																		('Rahul',3500,'Male',3)


select * from tblEmployeeDetails 

go



--Create a view

create view vwEmployeeDetails
as 
select Id, name, Gender, DepartmentId 
from tblEmployeeDetails


go

select * from vwEmployeeDetails
go


--1. parameterized view cannot be created

create view vwEmployeeDetails2
@Gender nvarchar(20)
as 
select Id, name, Gender, DepartmentId 
from tblEmployeeDetails
where Gender = @Gender

go

-- Error:	Msg 102, Level 15, State 1, Procedure vwEmployeeDetails2, Line 2 [Batch Start Line 54]
--			Incorrect syntax near '@Gender'.
--			Msg 137, Level 15, State 2, Procedure vwEmployeeDetails2, Line 6 [Batch Start Line 54]
--			Must declare the scalar variable "@Gender".


-- We can Filter Gender in the where clause 
select * from vwEmployeeDetails where gender= 'male'

go


-- 1.2 We can create Inline Table valued function as a replacement for Parameterized View(which we cannot create)


create function fnEmployeeDetailsByGender(@Gender nvarchar(10))
returns Table
as
Return
(
	select Id, name, Gender, DepartmentId 
	from vwEmployeeDetails 
	where gender= @Gender
)
go

--invoke the function
-- to invoke the inline table function we need to use 2 part name dbo.tablename

select * from dbo.fnEmployeeDetailsByGender('Female')
select * from dbo.fnEmployeeDetailsByGender('male')

go


-- 3. Order By clause is invalid in the views unless TOP or FOR XML is also specified.

create view vwEmployeeDetails2
as 
select Id, name, Gender, DepartmentId 
from tblEmployeeDetails
order by [Name] asc


go

--Error: The ORDER BY clause is invalid in views, inline functions, derived tables, subqueries, and common table expressions, unless TOP, OFFSET or FOR XML is also specified.

go




-- 4.View cannot be based on temporary tables.
-- # local temp table
-- ## global Temp table

Create Table ##TempTable(id int, Name nvarchar(20), Gender nvarchar(10))


insert into ##TempTable values(1,'shubham','Male')
insert into ##TempTable values(2,'Ravi','Male')
insert into ##TempTable values(3,'Shekhar','Male')
insert into ##TempTable values(4,'Neha','Female')


Select * from ##TempTable 
go

-- create view based on temp temp

create view vwTempTableData
as 
select id, name, gender
from ##TempTable


go

-- Error: Views or functions are not allowed on temporary tables. Table names that begin with '#' denote temporary tables.



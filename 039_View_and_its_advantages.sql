/*
	VIEW
	- A view is nothing more than a saves Sql query. 
	- A view also can be considered as a virtual table.

	- We can treat view like a table and fetch data just the way we fetch data like table.
		select * from <viewName>

	- It does not save and any, just saves the SQL query.



	- A VIEW in SQL Server is like a virtual table that contains data from one or multiple tables. 
	- It does not hold any data and does not exist physically in the database. 
	- Similar to a SQL table, the view name should be unique in a database. 
	- It contains a set of predefined SQL queries to fetch data from the database. 
	- It can contain database tables from single or multiple databases as well.



	-----------------------------------------------------------------------------------------
	Advantages
	----------
	1. View can be used to reduce the complexity of the database schema.

	2. Views can be used as Mechanism to implement row and columns level security.
		- check below to understand the concept

	3. Views can be used to prevent present aggregated data and hides detailed data.
	

	-----------------------------------------------------------------------------------------

	1. Create a view
		- syntax
			Create view <view_name>
			as
			--- Select script---
	
	
	2. Drop a view

		- Syntax
			Drop view <ViewName>

	3. alter a view

		- Syntax
			alter view <view_name>
			as
			----new select script----








	NOTE:
	TO CHECK ALL Index IN SQL
	- OBJECT EXPLORER > DATABASES > ANY_DATABASE > Views

*/

go


--Prerequisite


--create database sample;
--use sample;

-- Create a Department table

CREATE TABLE Department_tbl	(	departId int Primary Key identity,
									department_Name nvarchar(20) 
								)

--insert into emp_Department_tbl (department_Name) select 'IT';


insert into Department_tbl (department_Name) values (UPPER('payroll')),
														(UPPER('HR')),
														(UPPER('Admin')),
														(UPPER('Accounts'));


--sp_rename 'emp_Department_tbl', 'Department_tbl'

select * from Department_tbl;


-- Create Employee details

CREATE Table Employee_tbl (	Id int primary key identity,
						Name nvarchar(20),
						Salary nvarchar(10),
						Gender nvarchar(10),
						DepartmentId int,
						constraint FK_Employee_Department_tbl_By_ID foreign key (DepartmentId) references  Department_tbl(departId)
					)	


Insert into Employee_tbl (Name,Salary, Gender, DepartmentId) 
values	('Ram',5000,'Male',3),
		('Sham',3400,'Male',2),
		('Priya',6000,'Male',1),
		('Nik',4800,'Male',4),
		('Shekhar',3200,'Male', 1),
		('Rabina',3800,'Female',3),
		('Anand',5000,'Male',5)


select * from Employee_tbl;

go


-- Fetch all data using joins from two table
select Id,Name, Salary, Gender, d.department_Name
from Employee_tbl  e join Department_tbl  d on e.DepartmentId=d.DepartId 



-- sp_helptext vWEmployeesByDepartment
go



-- Create view for above query 

Create view vWEmployeesByDepartment
as
select Id,Name, Salary, Gender, d.department_Name
from Employee_tbl  e join Department_tbl  d on e.DepartmentId=d.DepartId 

go


-- Execute view

select * from vWEmployeesByDepartment;

go


-- implement row and columns level security.

-- Create a view with retreive only IT department records for granted person. (Row level security)

Create view vWEmployeesByITDepartment
as
select Id,Name, Salary, Gender, d.department_Name
from Employee_tbl  e join Department_tbl  d on e.DepartmentId=d.DepartId 
where d.department_Name = 'IT';



go

-- fetch all IT department employees records
select * from vWEmployeesByITDepartment

go


-- Create a view with retreive department records and hides salary. (column level security)


Create view vWEmployeesNonConfidentialData
as
select Id,Name, Gender,d.department_Name
from Employee_tbl  e join Department_tbl  d on e.DepartmentId=d.DepartId 


go



-- fetch all column except salary column department employees records
select * from vWEmployeesNonConfidentialData

go



-- present aggregate data

Create view vWSummarizedData
as
select d.department_Name as Department_Name, Count(Id) as TotalEmployee
from Employee_tbl  e join Department_tbl  d on e.DepartmentId=d.DepartId 
Group by d.department_Name

go


-- 
select * from vWSummarizedData

go


-- Alter a View
-- alter a view to fetch all it employees whose salary is greater than 5000 rs.

Alter view vWEmployeesByITDepartment
as
select Id,Name, Salary, Gender, d.department_Name
from Employee_tbl  e join Department_tbl  d on e.DepartmentId=d.DepartId 
where d.department_Name = 'IT' and Salary >= 5000


go

-- Drop a view



-- drop view vWEmployeesNonConfidentialData

go
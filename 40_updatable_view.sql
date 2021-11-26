/*
	Updatable View (virtual table)
	1. It is possible to update,Insert and delete record on Base table with views.

	2. We can create view with multiple table.
	


	Consclusion:

	If a view is based on multiple tables, and if we update a view, it may not update the underlying base tables correctly.
	To correctly update a view, that is based on multiple table, INSTEAD OF trigger is used.


*/

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




-- Create a view which show all column except salary column


Create View vWEmployeeDataExceptSalary 
as
select Id,Name,Gender,DepartmentId from Employee_tbl

go

-- fetch data using view

select * from vWEmployeeDataExceptSalary

go


-- # 1.1
-- Update base table with view (1 base table) 

update vWEmployeeDataExceptSalary 
set Name = 'Shiv' where id = '2'



select * from vWEmployeeDataExceptSalary
go


-- # 1.2
-- delete base table with view (1 base table)

delete vWEmployeeDataExceptSalary 
where id = '10';


select * from vWEmployeeDataExceptSalary
go

-- # 1.3
-- innsert record into base table with view (1 base table)
Insert into vWEmployeeDataExceptSalary (Name, Gender, DepartmentId) values ('Ritika', 'Female', 5)


select * from vWEmployeeDataExceptSalary
go




-- #2
-- Create View with 2 base table to fetch data 

Create view vWEmployeesByDepartment
as
select Id,Name, Salary, Gender, d.department_Name
from Employee_tbl  e join Department_tbl  d on e.DepartmentId=d.DepartId 

go

-- fetch records using view
select * from vWEmployeesByDepartment

go



--#2.1
-- update with view with multiple  base table.
update vWEmployeesByDepartment 
set department_Name= 'IT' where Name= 'Ram'			-- 1 row effected 


select * from vWEmployeesByDepartment

-- But when fetch all data we found that all HR rows become IT. (like rabina record)

-- check the base table
select * from Department_tbl
select* from Employee_tbl


-- We found that, after update a record using view above, its update the DepartmentName HR to IT and all employee with HR become IT.

-- To prevent above issue, we use INSTEAD OF trigger.
go


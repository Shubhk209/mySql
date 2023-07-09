/*
	An INSTEAD OF UPDATE trigger is fired instead of the default update operation on a table or view. 
	It allows you to define custom logic to be executed instead of the actual update operation.
*/

--Prerequisite

-- create database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'KudvenkatTutorial')
BEGIN
    CREATE DATABASE KudvenkatTutorial;
END

-- Create table 
CREATE TABLE tblEmployee
(
  Id int Primary Key,
  Name nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
)


CREATE TABLE tblDepartment
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)


-- add data to tables
--Insert data into tblDepartment table
Insert into tblDepartment values (1,'IT')
Insert into tblDepartment values (2,'Payroll')
Insert into tblDepartment values (3,'HR')
Insert into tblDepartment values (4,'Admin')

--Insert data into tblEmployee table
Insert into tblEmployee values (1,'John', 'Male', 3)
Insert into tblEmployee values (2,'Mike', 'Male', 2)
Insert into tblEmployee values (3,'Pam', 'Female', 1)
Insert into tblEmployee values (4,'Todd', 'Male', 4)
Insert into tblEmployee values (5,'Sara', 'Female', 1)
Insert into tblEmployee values (6,'Ben', 'Male', 3)
go


--Script to create the view:
Create view vWEmployeeDetails
as
Select Id, Name, Gender, DeptName
from tblEmployee 
join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId

go


Select * from vWEmployeeDetails

go

--Now, let's try to delete a row from the view, and we get the same error.
Delete from vWEmployeeDetails where Id = 1

/*
	Error
	Msg 4405, Level 16, State 1, Line 64
	View or function 'vWEmployeeDetails' is not updatable because the modification affects multiple base tables.
*/
go



--Script to create INSTEAD OF DELETE trigger:
Create Trigger tr_vWEmployeeDetails_InsteadOfDelete
on vWEmployeeDetails
instead of delete
as
Begin
 Delete tblEmployee 
 from tblEmployee
 join deleted
 on tblEmployee.Id = deleted.Id
 
 --Subquery
 --Delete from tblEmployee 
 --where Id in (Select Id from deleted)
End

go

/*
	Notice that, the trigger tr_vWEmployeeDetails_InsteadOfDelete, makes use of DELETED table. 
	DELETED table contains all the rows, that we tried to DELETE from the view. 
	So, we are joining the DELETED table with tblEmployee, to delete the rows. 
	You can also use sub-queries to do the same. In most cases JOINs are faster than SUB-QUERIEs. 
	However, in cases, where you only need a subset of records from a table that you are joining with, sub-queries can be faster.
	
*/
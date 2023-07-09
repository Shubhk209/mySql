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

-- select database
Use KudvenkatTutorial

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

-- update view data
Update vWEmployeeDetails 
set Name = 'Johny', DeptName = 'IT'
where Id = 1

/*
In Part 45, we tried to insert a row into the view, and we got an error stating - 
'View or function vWEmployeeDetails is not updatable because the modification affects multiple base tables.'

Now, while updating the view, in such a way that, it affects, 
both the underlying tables, and see, if we get the same error.

The following UPDATE statement changes Name column from tblEmployee and DeptName column from tblDepartment. 

So, when we execute this query, we get the same error.
*/

/*
-- Conclusion
If a view is based on multiple tables, and if you update the view, the UPDATE may not always work as expected. 
To correctly update the underlying base tables, thru a view, INSTEAD OF UPDATE TRIGGER can be used.
*/
go


--Script to create INSTEAD OF UPDATE trigger:
Create Trigger tr_vWEmployeeDetails_InsteadOfUpdate
on vWEmployeeDetails
instead of update
as
Begin
 -- if EmployeeId is updated
 if(Update(Id))
 Begin
  Raiserror('Id cannot be changed', 16, 1)
  Return
 End
 
 -- If DeptName is updated
 if(Update(DeptName)) 
 Begin
  Declare @DeptId int

  Select @DeptId = DeptId
  from tblDepartment
  join inserted
  on inserted.DeptName = tblDepartment.DeptName
  
  if(@DeptId is NULL )
  Begin
   Raiserror('Invalid Department Name', 16, 1)
   Return
  End
  
  Update tblEmployee set DepartmentId = @DeptId
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
 
 -- If gender is updated
 if(Update(Gender))
 Begin
  Update tblEmployee set Gender = inserted.Gender
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
 
 -- If Name is updated
 if(Update(Name))
 Begin
  Update tblEmployee set Name = inserted.Name
  from inserted
  join tblEmployee
  on tblEmployee.Id = inserted.id
 End
End

go


--Now, let's try to update JOHN's Department to IT. 
Update vWEmployeeDetails 
set DeptName = 'IT'
where Id = 1

/*	The UPDATE query works as expected. 
	The INSTEAD OF UPDATE trigger, correctly updates, JOHN's DepartmentId to 1, in tblEmployee table.
*/

--Now, let's try to update Name, Gender and DeptName. The UPDATE query, works as expected, without raising the error - 'View or function vWEmployeeDetails is not updatable because the modification affects multiple base tables.'
Update vWEmployeeDetails 
set Name = 'Johny', Gender = 'Female', DeptName = 'IT' 
where Id = 1
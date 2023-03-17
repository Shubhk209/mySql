/* Instead of triggers are used to update/insert in VIEW correctly that are based on multiple base tables. */

--Prerequisite
create database Test
go

use test
go


-- create Employee Table
Create TABLE tblEmployeeDetails (	Id int primary key ,
									[Name] nvarchar(20),
									salary int, 
									Gender nvarchar(10),
									DepartmentId int
									)

--insert into tblEmployeeDetails (Id,Name,salary,Gender,DepartmentId)values (1,'shubham',5000,'Male',3),
																		(2,'shivam',1000,'Male',2),
																		(3,'shivani',4000,'Female',3),
																		(4,'Nikhil',5100,'Male',4),
																		(5,'Hemant',3500,'Male',1),
																		(6, 'Rahul',3500,'Male',3)
truncate table tblEmployeeDetails
-- create department table
Create TABLE tblDepartment(	DeptId int IDENTITY(1,1) primary key ,
							DeptName nvarchar(50)
							)

insert into tblDepartment(DeptName) values ('IT'),('Payroll'),('HR'),('Admin')


-- create a view
Create view vw_EmployeeDetails
AS
Select Id,Name, Gender, de.DeptName 
from tblEmployeeDetails em inner join tblDepartment de on em.DepartmentId = de.DeptId



go

-- select view
select * from vw_EmployeeDetails

-- insert a row in view
Insert into vw_EmployeeDetails (Id,Name, Gender, DeptName)values ((select max(id) + 1 from vw_EmployeeDetails),'Vari','Female', 'IT')

Insert into vw_EmployeeDetails (Id,Name, Gender, DeptName)values (50,'Vari','Female', 'I')

-- Error : View or function 'vw_EmployeeDetails' is not updatable because the modification affects multiple base tables.
go 


-- create instead trigger for insert
Create trigger tr_vwEmployeeDetails_InsteadofInsert 
on vw_EmployeeDetails
Instead of Insert
AS
Begin

	-- create a variable which hold the deptid
	Declare @DeptId int

	--Check if there is a valid DepartmentId
	--for the given DepartmentName
	Select @DeptId = DeptId
	from tblDepartment
	join inserted
	on inserted.DeptName = tblDepartment.DeptName

	--If DepartmentId is null throw an error
	--and stop processing
	if (@DeptId is null)
	Begin
		Raiserror('Invalid Department Name. Statement terminated', 16, 1)
		return
	End
	

	--Finally insert into tblEmployee table
	Insert into tblEmployeeDetails(Id, Name, Gender, DepartmentId)
	Select Id, Name, Gender, @DeptId
	from inserted
end



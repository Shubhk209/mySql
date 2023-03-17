/*
	
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


select * from test..tblEmployeeDetails 



Create table tbl_employeeAuditTable (	id int primary key identity(1,1),
									AuditData nvarchar(max)
								)


Select * from tbl_employeeAuditTable
go


-- Create/Alter a update trigger

Create trigger tr_tblEmployee_ForUpdate
on tblEmployeeDetails
for update 
as 
Begin
	-- declare varable to store old and new data
	Declare @Id int
	Declare @OldName nvarchar(20), @NewName nvarchar(20)
	Declare @OldSalary nvarchar(20), @NewSalary nvarchar(20)
	Declare @OldGender nvarchar(20), @NewGender nvarchar(20)
	Declare @OldDeptId nvarchar(20), @NewDeptId nvarchar(20)
	
	-- create a string for Audit Table dynamically
	Declare @AuditString nvarchar(1000)

	-- insert row from inserted virtual table to Temp table
	Select * 
	into #TempTable
	from inserted

	-- while loop is used in case if user update multiple record at a time
	-- if select query returns no record, exists functiion return false and while loop get skiped.
	While(Exists(Select Id from #TempTable))
	Begin
		set @AuditString = ''
		
		-- set variable for inserted row form temp table
		Select top 1 @Id=Id, @NewName = Name, 
		@NewGender = Gender, @NewSalary = Salary,
		@NewDeptId = DepartmentId
		from #TempTable

		-- fetch record based on @id variable from deleted and set old data into variables
		Select @OldName = Name, 
		@OldGender = Gender, @OldSalary = Salary,
		@OldDeptid = DepartmentId
		from deleted where id = @id

		Set @AuditString = 'Employee with Id = ' + Cast(@id as nvarchar(4)) + ' changed '
		if(@OldName <> @NewName)
						set @AuditString = @AuditString + ' Name From ' + @OldName + ' to ' + @NewName

		if(@OldSalary <> @NewSalary)
						set @AuditString = @AuditString + ' Salary From ' + @OldSalary + ' to ' + @NewSalary
		
		if(@OldGender <> @NewGender)
						set @AuditString = @AuditString + ' Gender From ' + @OldGender + ' to ' + @NewGender

		if(@OldDeptId <> @NewDeptId)
						set @AuditString = @AuditString + ' DeptId From ' + @OldDeptId + ' to ' + @NewDeptId

		
		-- insert the @AuditString into Audit Table
		insert into tbl_employeeAuditTable (AuditData) values (@AuditString)

		-- delete the variable @id record from temp data, to prevent infinite loop and in case of multiple update scenario.
		delete from #TempTable where Id = @Id
	End
End


go




-- update and check the audit data
Update tblEmployeeDetails set Name='Ramesh', salary=5500, Gender='Male' where Id=5


Select * from tbl_employeeAuditTable

-- drop trigger tr_tblEmployee_ForUpdate
/*
	Trigger
	•	A trigger is a database object that runs automatically when an event occurs.
	In SQL Server, there are 3 types of triggers.
	1.	DML Trigger
	-	These are fired automatically in response to DML events (Insert, Update, delete)
	-	DML trigger can be classified into 2 types: After Tigger and Instead Of trigger.
	-	After Tigger, fire after the triggering action. The Insert, update and delete statements, causes an after trigger to fire the respective statement complete.
	-	Instead Tigger, fires instead the triggering action. The Insert, update and delete statements, causes an instead trigger to fire the respective statement complete.

	2.	DDL Trigger
	3.	Logon Trigger


	# For Trigger

	•	Sometime called as FOR triggers.
	•	These kinds of triggers fire after the execution of an action query that can be either DDL statements like Create, Alter and Drop or DML statements like Insert, Update and Delete.


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



-- Create After trigger to insert 
alter trigger tr_tbl_EmployeeDetails_ForInsert 
on tblEmployeeDetails
for insert 
as 
BEGIN
		-- check id from inserted table and store in id variable
		Declare @Id int
		select @Id=id from inserted

		-- insert the record into audit table
		insert into tbl_employeeAuditTable  values (	'New Employee with id: ' + 
														CAST(@Id as nvarchar(5)) + 
														' is added at ' + 
														cast(getdate() as nvarchar(max))
													)

END



-- insert data in employee table and check audit table

insert into tblEmployeeDetails (Name,salary,Gender,DepartmentId)values ('Riya',6000,'Female',1)

Select * from tbl_employeeAuditTable

go



-- #2. delete After trigger to insert 

alter trigger tr_tbl_EmployeeDetails_ForDelete
on tblEmployeeDetails
for delete 
as 
BEGIN
		-- check id from inserted table and store in id variable
		Declare @Id int
		select @Id=id from deleted

		-- insert the record into audit table
		insert into tbl_employeeAuditTable  values (	'New Employee with id: ' + 
														CAST(@Id as nvarchar(5)) + 
														' is removed at ' + 
														cast(getdate() as nvarchar(max))  
													)

END



-- delete data in employee table and check audit table

delete from tblEmployeeDetails where id=6

select * from test..tblEmployeeDetails 

Select * from tbl_employeeAuditTable

go
/*
	Multi statement table value function
	- very similar to Inline Table valued function, with few differnces.

	Differences
	-----------
	1. Inline table valued fucntion, returns clauses cannot contain the structure of the table, the function return
	- Mutli statemnet table valued function, we specify the structure of the table that gets returned.

	2.Inline table valued function cannot have BEGIN and END block.
	- Mutli statemnet table valued function have BEGIN and END block.

	3.Inline table valued function are better in performance than Mutli statemnet table valued function.
	- if the given task can be achieved using Inline table valued function, alway prefer to use them over Mutli statemnet table valued function.

	4. It possible to to update the underlying table , using an inline table valued function, not possible using multi statement table valued function.


	Reason for improved performance of an Inline table valued function.
	-------------------------------------------------------------------
	Internally, SQL Server treats an inline table values function much like it would a VIEW.
	-  Treats Mutli statemnet table valued function similar to  how it would a stored procedure.

	---------------------------------------------------------------------------------------------------------
	NOTE:
	TO CHECK ALL SCALAR FUNCTION IN SQL
	- OBJECT EXPLORER > DATABASES > ANY_DATABASE > PROGRAMMABILITY > TABLE-VALUED FUNCTION > fUNCTION_NAME
*/



--Prerequisite
-- Nvarchar - take 2 length space, so nvarchar(40x2)= 80 length
create table tblPersonDob2 (id int identity,
					Name nvarchar(40),
					DOB datetime,
					Gender nvarchar(10),
					DepartmentID int
					) 

-- Alter the table
--alter table tblPersonDOB2 alter columns Gender nvarchar(15);

--Drop table tblPersonDob2

--sp_help tblPersonDOB2; 

select * from tblpersonDob2; 

insert into tblpersonDob2(Name, DOB, Gender, DepartmentID)
values ('Sam',cast('1986-12-12 00:00:06.267' as datetime),'Male', 1),
		('Radhika',cast('1995-02-10 00:23:06.267' as datetime),'Female', 2),
		('kame',cast('2001-04-10 00:12:06.267' as datetime),'Male', 1),
		('shiv',cast('1996-10-20 00:02:06.267'as datetime),'Male', 1),
		('Rani',cast('1994-11-20 00:02:06.267'as datetime),'Female', 2);	
		
		
select * from tblpersonDob2;

--Create table
Create table tblEmpDepartment (Id int identity,
								[Department Name] nvarchar(20));
--insert
insert into tblEmpDepartment ([Department Name]) values ('IT'),('Account');

select * from tblEmpDepartment;						 

GO


-- Inline Table Value Fucntion
Create function fn_ILTVF_GetEmployees()
Returns Table
as
Return (select Id, Name, CAST(DOB as Date)as DOB from tblPersonDob2)

go

--invoke Inline Table Value Fucntion

select * from fn_ILTVF_GetEmployees();
go


-- Update the tblPersonDob2 using  inline table valued function.

update fn_ILTVF_GetEmployees() set Name='Karan' where Name='kame' and id= 3;		-- updated Name 'Kame' to 'Karan'

go




-- Multi Statement table value function Creation

Create function fn_MSTVF_GetEmployees()
-- returning the specfied structured table 
Returns @Table Table (Id int, Name Nvarchar(20), DOB Date)
AS
Begin 
	Insert into @Table
	select Id, Name, CAST(DOB as Date)as DOB from tblPersonDob2

	Return

End

go

-- invoke Multi Statement table value function

Select * from fn_MSTVF_GetEmployees();

go


-- Update the tblPersonDob2 using Multi Statement table value function.

update fn_MSTVF_GetEmployees() set Name='Karan' where Name='kame' and id= 3;	-- Object 'fn_MSTVF_GetEmployees' cannot be modified.

-- Reason:
-- this table is not getting data directly from the 'tblPersonDob2'.
-- Instead it inserting the data from tblPersonDob2 into @Table variable before returning it.

go

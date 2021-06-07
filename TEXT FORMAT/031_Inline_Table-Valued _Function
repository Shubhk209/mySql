/*
	Inline Table-valued Function
	----------------------------

	SCALAR FUNCTION: RETURNS A SCALAR VALUE
	INLINE TABLE VALUED FUNCTION: RETURN A TABLE.
	
	1. Specify TABLE as return type
	2. Function body is not enclosed between BEGIN and END.
	3. The structure of the table that get returned, determined by the SELECT statement with in the function.


	- Inline Table Value fucntions can be used to acheieve the functionality of parameterized views.
	
	-----------------------------------------------------------------------------------------------------------
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

-- CREATE FUNCTION TO GET EMPLOYEE BY GENDER

Create function fn_EmployeeByGender (@Gender nvarchar(10))
RETURNS TABLE
AS 
RETURN (SELECT Id, Name, DOB,Gender, DepartmentID
		FROM tblPersonDob2
		WHERE Gender= @Gender
		)


--NOTE:
--	TO CHECK ALL SCALAR FUNCTION IN SQL
--	- OBJECT EXPLORER > DATABASES > ANY_DATABASE > PROGRAMMABILITY > TABLE-VALUED FUNCTION > fUNCTION_NAME
GO

-- Invoke/Call the function

Select * from fn_EmployeeByGender('MALE');
Select * from fn_EmployeeByGender('FEMALE');

go


-- Call function and use JOINS

Select e.Id,e.Name,e.DOB, d.[Department Name]
from fn_EmployeeByGender('MALE') as e 
JOIN tblEmpDepartment d on e.DepartmentId= d.id;


--Select *
--from fn_EmployeeByGender('MALE') as e 
--inner join tblEmpDepartment d on e.DepartmentId= d.id;


Select e.Id,e.Name,e.DOB, d.[Department Name]
from fn_EmployeeByGender('FEMALE')as e 
JOIN tblEmpDepartment d on e.DepartmentId= d.id;
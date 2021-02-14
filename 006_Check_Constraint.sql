/*

	Check Constraint
	- It is used to limit the range of the values,
		- that can be entered for a column.
	
	- Syntax
		1. Add CHECK CONSTRAINT While Creating a table.
			CREATE TABLE EMPTable	(id int,
									 Name varchar(10),
									 salary int check (salary =10000)
									);
		
		2. ADD CHECK CONSTRAINT After Creating a table
			ALTER TABLE <TABLE_NAME>
			ADD CONSTRAINT <CONSTRAINT NAME> CHECK (CONDITION-BOOLEAN EXPRESSION)
			
			OR
			ALTER TABLE <TABLE_NAME> ADD CHECK (CONDITION-BOOLEAN EXPRESSION)

		3. DROP THE CHECK CONTRAINT
			ALTER TABLE <TABLE_NAME>
			DROP CONSTRAINT <CONSTRAINT_NAME>

			OR

			ALTER TABLE <TABLE_NAME>
			DROP
			


	- IF CONDITION RETURN TRUE
		- CHECK CONTRAINT ALLOW THE VALUE TO INSERT IN COLUMN, OTHERWISE IT DOESN'T.
		
	- IF COLUMN IS NULLABLE,
		- IT IS POSSIBLE TO PASS NULL VALUE FOR THIS COLUMN, WHILE INSERTING A ROW.
		- THE BOOLEAN EXPRESSION EVALUATES TO 'UNKNOWN', AND ALLOW THE VALUE.
						 

	NOTE:
	- if the table contains value(s) with does pass the boolean expression(return false) 
	  of check constraint, 
		-the alter operation to add constraint in a table show error(conflict occurs).
		
		- ERROR
		The INSERT statement conflicted with the CHECK constraint "CK__tblPerson2__Age__2C3393D0". 
		The conflict occurred in database "Sample", table "dbo.tblPerson2", column 'Age'.
		
	
	USING GUI TO add check constraint
	- Path: OE\Databases\<Database_Name>\ Tables \ <table_Name> [expand] \ Constraints(Right click)\ new Constraint
		- General\ Expression (Give boolean expression)
		- Table Designer \ check existing data on creation or Re- enabling  				 

*/

USE [Sample]
GO

CREATE TABLE tblPerson2	(Id int NOT NULL,
						 Name varchar(30) NOT NULL,
						 Email varchar(50) NOT NULL,
						 GenderId int,
						 Age int
						 foreign key (GenderId) references tblGender(ID) 
						);

--ALTER TABLE tblPerson2 alter column Name varchar(100);
--ALTER TABLE tblPerson2 alter column Email varchar(100);

INSERT INTO tblPerson2 (Id,Name,Email,GenderId,Age) 
values (1,'John','j@j.com',null,null),
		(2,'Ron','r@r.com',1,null),
		(3,'Rich','ri@ri.com',null,null);


select * from tblPerson2;
go


--enter invalid age
insert into tblPerson2 (Id,Name,Email,GenderId,Age) values (5,'Lara','l@l.com',2, -970);

update tblPerson2 set Age = null where Id = 4;
go


-- ALT+F1 - TABLE DESCRIPTION (SELECT TABLE_NAME THEN PRESS KEYS)

-- Add Check constraint after creating the table with custom constraint name
ALTER TABLE tblPerson2
ADD CONSTRAINT Ck_tblPerson2_Age CHECK(Age > 0 and Age < 150 ); 

--OR

-- Add Check constraint after creating the table without custom constraint name
ALTER TABLE tblPerson2
ADD CHECK(Age > 0 and Age < 150 ); 
Go


--drop the check
Alter table tblPerson2
drop constraint CK__tblPerson2__Age__2C3393D0;
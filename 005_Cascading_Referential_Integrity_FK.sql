/*

	Cascading Referential Integrity
	-Constraint
	-it allows to define actions MSSS
		- when a attempt to delete or update a key to which an existing foreign keys points.

	For Example:
	-If you delete row with id =1 from tblGender table, then row with ID= 3 from the tblPerson table become an ORPHAN RECORD.
	-YOU WILL NOT BE ABLE TO TELL THE GENDER FOR THIS ROW.
	-So, Cascading Refential Integrity constraint can be used to define actions
		- MS SQL Server should take when this happen.
	- By default, we get an error and the delete or update statement is rolled backed.
	
	
	*******************************************************************************************
	* Path--> Tables>Keys> Foreign Key(Double click)>INSERT and Update Specification [Expand] *
	*******************************************************************************************		
	
	Option when setting up Cascading Referential Integrity Constraint:

	1. No Action
	- default Behaviour
	- Specifies that if a attempt is made to delete or update a row with a key referenced by foreign key in existing rows in other tables,
		- an ERROR is raised and DELETE or UPDATE is rolled back.
			-ERROR:	The DELETE statement conflicted with the REFERENCE constraint "tblPerson_GenderID_FK". 
					The conflict occurred in database "Sample", table "dbo.tblPerson", column 'GenderId'. 

	2. Cascade
	- if an attempt is made to delete or update a row with a key referenced by foreign keys in existing rows in other tables
	- All row containing those foreign key are also deleted or updated.


	3. Set NULL
	- all Rows containg those foreign key are set to NULL

	4. Set Default
	- All rows containting those foreign key are set to Default values.



*/

Use Sample
go

select * from tblPerson;
Select * from tblGender;
go


update tblPerson set GenderId = 1
where Name = 'Rich';
go


-- delete a row from a table which referenced a foreign key to another table.
DELETE FROM tblGender 
WHERE Gender= 'Male' ;
go
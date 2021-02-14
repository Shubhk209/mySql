-- What is unique key constraint?
-- when do you use unique key constraint over primary key constraint.
-- Diffence betweekey unique key cnstraint and primary key constraint.


/*

	Unique key
	- to enforce uniqueness of a column
		- i.e the column shouldn't allow any duplicate values.
	- Add unique key
		- Table designer option [GUI] [Design]
		- using query 


	To create the unique key using query
	
	1. After creating table
		ALTER TABLE
		ADD CONSTRAINT <CONSTRAINT_NAME> UNIQUE(<COLUMN_NAME>)






	A TABLE CAN HAVE ONLY ONE PRIMARY, IF WE WANT ENFORCE UNIQUENESS ON 2 OR MORE COLUMNS,
		-THEN WE HAVE TO USE UNIQUE KEY.
		
	
	DIFFERENCE BETWEEN PRIMARY KEY AND UNIQUE KEY CONSTRAINT
	1. A TABLE CAN HAVE ONLY ONE PRIMARY KEY, BUT MORE THAN ONE UNIQUE KEY.
	2. PRIMARY KEY DOES NOT ALLOW NULLS, WHERE AS UNIQUE KEY ALLOWS ONE NULL.
	
	
	
	GUI MODE TO CREATE UNIQUE KEY
	PATH : TABLES\ TABLE_NAME(RIGHT CLICK)\ DESIGN \ COLUMN_NAME (RIGHT CLICK) \ [INDEXES/ KEYS] 
		- ADD\ IDENTITY {NAME: UK_tABLENAME_COLUMNNAME}
		- GENERAL \ COLUMNS \ COLUMN_NAME
		- gENERAL \ IS UNIQUE {YES}		
		- gENERAL \ TYPE {UNIQUE}
*/


USE Sample
GO



SELECT * FROM tblPerson;
go

--create a unique key after creating table
alter table tblperson
add constraint UQ_tblperson_Email unique (Email);


insert into tblPerson values (10, 'sarra', 'sara@sa.com', 1);
go;



--drop the unique key
alter table tblperson
drop constraint UQ_tblPerson_Email
go
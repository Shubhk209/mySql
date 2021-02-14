/*
	
	Primary Key
	- The PRIMARY KEY constraint uniquely identifies each record in a table.
	- It must contain UNIQUE values 
	- cannot contain NULL values.

	Syntax:
	
	CREATE TABLE Persons (
    ID int NOT NULL PRIMARY KEY,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int
	);
	
	OR
	
	
	CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
	);

	Foreign Key
	- A FOREIGN KEY is a key used to link two tables together.
	
	- A FOREIGN KEY is a field (or collection of fields) in one table that refers to the PRIMARY KEY in another table.
	
	-The table containing the foreign key is called the child table, 
		-and the table containing the candidate key is called the referenced or parent table.
	
	
	- Used to enforce database integrity
	
	- A foreign key in a one table points to a primary key in another table.
	
	- It prevent invalid data from inserted into the foreign key column.
	
	- The values that you enter into the foreign key column(tblPeson GenderID),
		has to be one of the values contained in the table(tblGender ID) it points to. 

	Syntax:
	
	Alter table <ForeignKey_Table>
	ADD CONSTRAINT foreignkeyTable_ForeignKeyColumn_FK
	Foreign Key (Foriegn Key Column) references PrimaryKeyTable (PrimaryKeyColumn);


*/

--To Create a Table
	-- Graphically: Object Explorer>Databases>(DataBaseName)>Tables(Right Click)>New Table
	
	-- Using Query
	USE [Sample]
	GO

	--create a table Person
	CREATE Table tblPerson
	(ID int NOT NULL Primary Key,
	Name nvarchar(50) NOT NULL,
	Email nvarchar(50)NOT NULL,
	GenderId int
	);
	go
	
	
	
	-- Create a Gender Table
	CREATE Table tblGender
	(ID int NOT NULL Primary Key,
	Gender nvarchar(50) NOT NULL);
	go


--Add Foreign Key
	-- Graphically: Object Explorer>Databases>(DataBaseName)>Tables[Expend]>TableName(Right Click)
	--				>Design>ColumnName(Right Click)>Relationships>Add>Table ANd Columns Specificals
		-- pkey- tblGender id , Fkey - tblPerson GenderID
	
	--Using Query
	ALTER TABLE tblPerson 
	ADD CONSTRAINT tblPerson_GenderID_FK 
	Foreign Key (GenderID) references tblGender (ID);
	Go 
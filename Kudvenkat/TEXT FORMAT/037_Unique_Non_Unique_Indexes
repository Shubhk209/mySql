/*
	Unique and Non-unique 
	----------------------

	1. Unique Index

	- It is used to enforce unqiueness of the key values in the index.

	Note : by default, primary key constraint, create a unique clustered index.

	- Uniqueness is a property of an index, and both CLUSTERED and NON-CLUSTERED indexes can be UNIQUE.

	Difference between Unique Constraint and Unique index
	-----------------------------------------------------
	- No major diference,
	- In fact when we add unique constraint, a unique index gets created behind the scene.


	When should we be creating a UNIQUE CONSTRAINT Over UNIQUE INDEX.
	-----------------------------------------------------------------

	- Create a unique constraint, when data integrity is the objective.
	- in either cases, data is validated in the same manner, the query optimizer does not differntiate between a unique constraint or manually created.
	
	
	Useful POint to Remember 
	------------------------
	 

*/


--Prerequisite

CREATE TABLE tblEmployeeForIndex4 (	Id int PRIMARY KEY,
									[First Name] nvarchar(20),
									[Last Name] nvarchar(20),
									Salary int check (Salary >=7500),
									Gender nvarchar(10) check (Gender = 'Male' OR Gender='Female' OR Gender='Other'),
									City nvarchar(50)
									) 


-- Drop table tblEmployeeForIndex4
go

-- check the indexes present in the table.

sp_helpindex tblEmployeeForIndex4

go

-- We can check if the index is unique or not,
	-- OBJECT EXPLORER > DATABASES > ANY_DATABASE > Tables> Table_name > Index > Index_name > (Right click)Property
		-- we find the unique checkbox is checked.
go


-- Drop a unique index

drop index tblEmployeeForIndex4.PK__tblEmplo__3214EC07CC413945

--IF we try to drop unique index using query we get ERROR:
	-- An explicit DROP INDEX is not allowed on index 'tblEmployeeForIndex4.PK__tblEmplo__3214EC073B3AC176'. 
	--It is being used for PRIMARY KEY constraint enforcement.

-- WE can drop unique index GUI
	-- But doing will remove PRIMARY KEY constraint too. 


go

sp_helpindex tblEmployeeForIndex4

go


-- Index to ensure that NO employee can have same First name and Last name.

Create Unique NonClustered Index 
UIX_tblEmployeeForIndex4_First_LastName 
On tblEmployeeForIndex4([First Name], [Last Name]);



go






-- when we add unique constraint, a unique index gets created behind the scene.
-- ALter table to Make City column Unique.
ALTER TABLE tblEmployeeForIndex4
ADD CONSTRAINT UQ_tblEmployeeForIndex4_City
UNIQUE(City);



-- When we do this we add a Unique Non-clustered index in the table.
		--KEY: [UQ_tblEmployeeForIndex4_City]
		--Index: [UQ_tblEmployeeForIndex4_City] (unique and non clustered index)

go


-- Alter and add clusterd index
ALTER TABLE tblEmployeeForIndex4
ADD CONSTRAINT UQ_tblEmployeeForIndex4_City
UNIQUE CLUSTERED(City);

go


INSERT INTO tblEmployeeForIndex4 (ID,[First Name], [Last Name],Salary,Gender,City) Values	(1,'Ram','Sharma',17300,'Male','New Delhi'),
																							(2,'Riya','Sharma',24000,'Female', 'Old Delhi')


--ERROR in Case of duplicate in ID,  CIty column(Unique Constaint key)
	-- Violation of UNIQUE KEY constraint 'UQ_tblEmployeeForIndex4_City'. 
	-- Cannot insert duplicate key in object 'dbo.tblEmployeeForIndex4'. The duplicate key value is (New Delhi).

--truncate table tblEmployeeForIndex4


/*
	Types of Index
	--------------
	1. Clustered
	2. Non-Clustered
	3. Unique
	4. Filter
	5. XML
	6. Full Text 
	7. Spatial
	8.Cloumnstore
	9. Index included column
	10. Index on computed columns

	--------------------------------------------------------------------------------------
	1. Clustered Index

	- It determines the physical order of the table.
	- For this reason, a table can hold only one clustered index.
	- It determines the order in which data will stored.

	Note: In below example (insert tblEmployeeForIndex2), the values of id column are not sequential order.
			- But when we fetch data using SELECT query, we get id column in sequential order.

	Note: Id column is marked as PRIMARY KEY.
	-- PRIMARY KEY, constraint create clustered indexes automatically if no clustered index already exists.

	To confirm: sp_helpindex table_name


	- A Clustered Index is analogous to a telephone directory, where the data arranged by the last name.
		- A table can have only one clustered index.
	- The index can contain multiple column (a composite index) 

	


	Syntax:
	-------

	CREATE CLUSTERED INDEX Index_Name ON tableName (ColumnName1 Order, ColumnName2 Order)


	Note: if we try to create a CLUSTERED INDEX on a table which have a PRIMARY KEY	constraint,
			- we will get an error

			Msg 1913, Level 16, State 1, Line 97
			The operation failed because an index or statistics with name 'IX_tblEmployeeForIndex3_Gender_Salary' already exists on table 'tblEmployeeForIndex3'.

	- We need to drop the INDEX in table with PRIMARY KEY using GUI
		
			OBJECT EXPLORER > DATABASES > ANY_DATABASE > Tables> Table_name > Index > index_name(right click > delete)

	- If we try to drop the INDEX in table with PRIMARY KEY using query
		DROP index tableName.indexName

		Error: 

	-----------------------------------------------------------------------------------------------------------
	
	2. NON	Clustered Index
	-----------------------
	- It is analogous to an index in a text book.
	- The data is stored in one place, the index is another place.
	- the index will have pointer to the storage location of the data.

	- It is stored separately from the actual data, a table can have more than one non-cluster index.
	- Like a book can have an index by chapter at the beginning and another index by common terms at the end. 

	- In the index itself, the data is stored in an ascending order or descending order of the index key, which doesn't in any way inflence the storage of data in the table.


	Syntax:
	Create NonClustered index IX_tblEmployee_Name on table tblEmployee(Name);

	----------------------------------------------------------------------------------------------------------
	Differnce
	---------

	1. Only one cluster index per table
	- we can have more than one non- clustered index

	2. Clustered index is faster than non-clustered index, because the clustered index has to refer back to table.
		--if the selected column is not present in the index.
		-- meaning, if we select query with multiple column in non-cluster index then for not present column in index table(as we know it store index in different location), 
			--it need to look up table for the data

	
	3. Cluster index determines the storage order of the rows in the table.
			-- hence doesn't required additional disk space 
		- Non-Clustered index is stored separately from the table, additional storage is required.
		 

	

	-----------------------------------------------------------------------------------------------------------
	NOTE:
	TO CHECK ALL Index IN SQL
	- OBJECT EXPLORER > DATABASES > ANY_DATABASE > Tables> Table_name > Index
	
*/


--Prerequisite

CREATE TABLE tblEmployeeForIndex2 (	Id int PRIMARY KEY,
									Name nvarchar(20),
									Salary int check (Salary >=7500),
									Gender nvarchar(10) check (Gender = 'Male' OR Gender='Female' OR Gender='Other'),
									City nvarchar(50)
									) 

INSERT INTO tblEmployeeForIndex2 (ID,Name,Salary,Gender,City) Values (3,'Ram',17300,'Male','New Delhi'),
															(1,'Tamana',24000,'Female', 'Kolkata'),
															(4,'Kam',9500,'Male','Bihar'),
															(5,'Tim',8600,'Male','Goa'),
															(2,'Sima',31200,'Female','Mumbai')


Select * from tblEmployeeForIndex2;
go

--To confirm: 
execute sp_helpindex tblEmployeeForIndex2

go


-- 
CREATE TABLE tblEmployeeForIndex3 (	Id int PRIMARY KEY identity,
									Name nvarchar(20),
									Salary int check (Salary >=7500),
									Gender nvarchar(10) check (Gender = 'Male' OR Gender='Female' OR Gender='Other'),
									City nvarchar(50)
									) 

INSERT INTO tblEmployeeForIndex3 (Name,Salary,Gender,City) Values ('Ram',17300,'Male','New Delhi'),
															('Tamana',24000,'Female', 'Kolkata'),
															('Kam',9500,'Male','Bihar'),
															('Tim',8600,'Male','Goa'),
															('Sima',31200,'Female','Mumbai')



Go


-- Create Clustered Index on the Gender and Salary (Composite index)

CREATE Clustered Index IX_tblEmployeeForIndex3_Gender_Salary
On tblEmployeeForIndex3 (Gender DESC, Salary ASC)


-- error occur:The operation failed because an index or statistics with name 'IX_tblEmployeeForIndex3_Gender_Salary' already exists on table 'tblEmployeeForIndex3'.
go


-- Drop the index
DROP index tblEmployeeForIndex3.[IX_tblEmployeeForIndex3_Gender_Salary]

go


Select * from tblEmployeeForIndex3
go


--To confirm: 
sp_helpindex tblEmployeeForIndex3

go



-- Create Non-Clustered Index on the Name column

Create NonClustered index IX_tblEmployee_Name on  tblEmployeeForIndex3(Name);

go


--To confirm: 
exec sp_helpindex tblEmployeeForIndex3

go
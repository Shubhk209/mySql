/*
	Index
	-----
	
	- It is used by queries to find data from table quickly.
	- it is created on table and views
	- Index on a table or a view, is a similar to an index that we find in a book.

	- If we do not have index, and i ask you to locate a specific chapter in the book,
		- we will have to look at every page starting from the first page of the book.
	
	- On other hand, if we have the index, we lookup the page number of the chapter in the index,
		- and then directly go to that page number to locate the chapter.

	- Obviously, the book index is helping to drastically reduce the time it takes to find the chapter.

	- Table and View indexes, can help the query to find data quickly.

	- In fact, the existance of the right index, can drastically improve the performance of the query
	- If there is no index to help the query, then the query engine, checks every row in the table from beginning to the end.
		 - This is called as Table Scan.
	- Table scan is bad for performance.

	---------------------------------------------------------------------------------------------------------------------------
	On 1. problem, 
	- the query engine has to check each and every row in the table, the resulting in a table scan.
	- Which is adversely effect the performance, especially if the table is  larger. 
	- Since there is no index, to help the query, the query engine performs an entire table scan.

	------------------------------------------------------------------------------------------------------

	Syntax
	------

	CREATE INDEX Index_name ON TableName(Column_Name Order)


	Ex: CREATE INDEX IX_tblEmployee_Salary ON tblEmployeeForIndex(Salary ASC)


	-- 'IX' Prefix is conventional way to write index name to indicate it is a index.



	Using GUI
	---------
	OBJECT EXPLORER > DATABASES > ANY_DATABASE > Tables> Table_name > Index >New Index(Right click on Index)

	1. Index Name
	2. Index Type: Clustered, Non-Clustered, Primary XML, Spatial
	3.Unique (check box)
	4. ADD : mention the column name we want to index.


	------------------------------------------------------------------------------------------------------

	After Creating Index, 
	- When Sql server has to execute the same query, it has an index on the salary column to help this query.
	- Salaries between are range of 10000 and 25000 are usually present at the bottom.
		- Since the salaries are arranged in an ascending order.
	- Sql server picks up the ROW ADDRESSES index and directly Fetch the records from the table, rather than scanning each row in the table.
		- This is called as INDEX SEEK.



		Salary	| RowAddress
		---------------------------------
		2500	| Row_Addess_in_Hex_Code1
		---------------------------------
		3100	| Row_Addess_in_Hex_Code2
		---------------------------------
		4500	| Row_Addess_in_Hex_Code3
		---------------------------------
		6500	| Row_Addess_in_Hex_Code4
		---------------------------------
		

	-------------------------------------------------------------------------------------------------------
	NOTE:
	TO CHECK ALL Index IN SQL
	- OBJECT EXPLORER > DATABASES > ANY_DATABASE > Tables> Table_name > Index
	 
	


*/

go

--Prerequisite

CREATE TABLE tblEmployeeForIndex (	Id int identity,
							Name nvarchar(20),
							Salary int check (Salary >=7500),
							Gender nvarchar(10) check (Gender = 'Male' OR Gender='Female' OR Gender='Other')
							) 

-- drop table tblEmployeeForIndex

INSERT INTO tblEmployeeForIndex (Name,Salary,Gender) Values ('Ram',17300,'Male'),
															('Tamana',24000,'Female'),
															('Kam',9500,'Male'),
															('Tim',8600,'Male'),
															('Sima',31200,'Female'),
															('Dim',15000,'Male'),
															('Raj',11000,'Male'),
															('Rao',13600,'Male'),
															('Shivi',12500,'Female'),
															('Nik',19000,'Male'),
															('Pooja',14400,'Female'),
															('Sham',15700,'Male'),
															('Nick',16000,'Female'),
															('Dreake',18500,'Male'),
															('Somi',40500,'Female'),
															('Dam',20500,'Male')

Select * from tblEmployeeForIndex

go



-- 1. To find all employees, whose salary greater than 10000 and less than 25000.

Select * from tblEmployeeForIndex where salary >= 10000 and Salary <= 25000



	-- the query engine has to check each and every row in the table, the resulting in a table scan.
	-- Which is adversely effect the performance, especially if the table is  larger. 
	-- Since there is no index, to help the query, the query engine performs an entire table scan.

go



-- Create Index for tblEmployeeForIndex

CREATE INDEX IX_tblEmployee_Salary ON tblEmployeeForIndex(Salary ASC)


-- Check 
go


-- Check description of Index

sp_helpindex tblEmployeeForIndex.
go


-- Drop the Index

Drop index tblEmployeeForIndex.IX_tblEmployee_Salary
go
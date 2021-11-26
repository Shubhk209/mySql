/*

-- Indexes are used by queries to find data quickly.

-- Benefits get from use of indexes 
1. select queries with where clause 
2. delete and update queries can get benefits with use of indexes
3. Order by ascending/descending (no need to sort the table again)
4. group by  


---------------------------------------------------------------------------------------------
	DISADVANTAGES
	-------------

	1. Additional Disk space
	- Clustered index doesnot require any additional storage.
	- Every non-Clustered index requires additional space as it is stored separately from the table.
	- the amount of space requires depend upon the size of the table and the number and types of column used in the index.
	
	
	2. Insert, update and update statement can become slow.
	- When DML(Data Manipulation Langauage) statements (INSERT, UPDATE, DELETE) modifies data in a table, the data in all the indexes also needs to be updated.
	- Indexes can help, to search and locate the rows that we want to delete, but too many indexes to update can hurt the performance of data modification. 

	
	3. WHat is covering queries.(Advantage)
	- if all the columns that you have requested in the select clause or query are present in the index, there is no need to lookup in the table again.
	- The requested columns data can simply be returned from the index.


	4. A clustered index always covers a query.
	- Since it is contains all data in table. 
	- A composite index is a index on two or more columns.
	- Both clustered and non- clustered indexes can be composite indexes.
	- To a certain extent, a composite index can cover a query.


*/



--Prerequisite


--Create database Sample
use Sample

CREATE TABLE tblEmployeeForIndex5 (	Id int PRIMARY KEY identity,
									[First Name] nvarchar(20),
									[Last Name] nvarchar(20),
									Salary int check (Salary >=7500),
									Gender nvarchar(10) check (Gender = 'Male' OR Gender='Female' OR Gender='Other'),
									City nvarchar(50)
									) 


-- drop table tblEmployeeForIndex5

--alter table tblEmployeeForIndex5 add id int Primary Key identity

--SET IDENTITY_INSERT dbo.tblEmployeeForIndex5 OFF



INSERT INTO tblEmployeeForIndex5 ([First Name],[Last Name], Salary, Gender, City) VALUES
('Manoj','Mishra',45000,'Male','New Delhi'),
('Sara','Khan',65000,'Female','Banglore'),
('Shekhar','Khanna',25000,'Male','Goa'),
('Ayushi','Sharma',35000,'Female','Mumbai'),
('Shivam','Shukla',75000,'Male','Uttar Pradesh')


select * from tblEmployeeForIndex5


-- sp_help tblEmployeeForIndex5


-- Create a non-clustered index

--CREATE NonClustered index tblEmployeeForIndex5_Salary ON tblEmployeeForIndex5(salary)


go


-- ADVANTAGES--
go

-- select statement with WHERE clause 

SELECT * FROM tblEmployeeForIndex5 WHERE SALARY > 40000  AND SALARY < 80000

-- ABOVE QUERY CAN BENEFITS FROM NON- CLUSTERED INDEX
	-- because salary records are in sorted in ascending order which help query engine narrow down the records in index
	-- and with row address in index it fetch the remaining columns data.


go




-- DELETE and Update statement 


--Delete from tblEmployeeForIndex5 where Salary = 25000

--Update tblEmployeeForIndex5 set Salary= 9000 where salary =25000


-- suppose we have millions  of records and want to delete and update a record whose salary is 25000
	--  we need to check all record in above case if non-clustered index is not there.
	-- So using non-clustered index, we can find the records quickly bexause it is in sorted manner and delete/update the records faster.

go



-- Order BY statement

select * from tblEmployeeForIndex5 order by Salary

select * from tblEmployeeForIndex5 order by Salary desc


-- in this case, the salary are pre-sorted in index, so the query engine scan the records from index and fetch the other column data from table using row address.
-- it avoid sorting the result during query execution.

-- in case query 2, the query engine scan the index from reverse order and fetch the other column data from table using row address which improve performance of query execution.

go



-- Group by
-- fetch the no of emp based on salary 

select salary, count(salary) as TOTAL
from tblEmployeeForIndex5
Group by Salary



-- due to the records are in sorted order it is easy to group the records.



/*
	SELF JOIN
	- Joining a table with itself - Self Join
		- It is not a different type of table.

	SELF JOIN CAN BE CLASSIFIED UNDER ANY TYPE OF JOIN:
	- INNER SELF JOIN 
	- OUTER SELF JOIN (LEFT,RIGHT, FULL)
	- CROSS SELF JOIN


	WITHOUT USING ON CLAUSE
		
		SELECT column_name(s)
		FROM table1 T1, table1 T2
		WHERE condition;




*/

USE Sample

GO


-- CREATE EMPLOYEE TABLE WITH MANAAGER ID
 CREATE TABLE tblEmployee3	([Employee ID] INT PRIMARY KEY IDENTITY,
							 Name  nvarchar(30),
							 ManagerID  int not null unique);

-- NOT NULL TO NULL Constraint
Alter table tblEmployee3 alter column ManagerId  int null ;

-- remove unique key constraint
ALter table tblEMployee3 drop constraint UQ__tblEmplo__3BA2AA802B32FCB7;

-- check table information
exec sp_help tblEmployee3;


-- Reset identity count
DBCC CHECKIDENT('tblEmployee3',RESEED,0);

-- truncate the table
truncate table tblEmployee3;


--insert data into tblEmployee3 Table
INSERT INTO tblEmployee3(Name,ManagerID)
VALUES	('Mike', 3),
		('Rob', 1),
		('Todd', Null),
		('Ben', 1),
		('Sam', 1);

select * from tblEmployee3;	

GO



-- LEFT OUTER SELF JOIN
-- E.Employee Id List ---Matches to---> M.EmployeeID LIST

SELECT	*	--e.Name As Employee, m.Name as Mananger 
FROM		tblEmployee3 e 
LEFT JOIN	tblEmployee3 m
ON			e.ManagerID= m.[Employee ID];

go


-- Right OUTER SELF JOIN
-- E.Employee Id List <---Matches to--- M.EmployeeID LIST
SELECT	*	--e.Name As Employee, m.Name as Mananger 
FROM		tblEmployee3 e 
RIGHT JOIN	tblEmployee3 m
ON			e.ManagerID= m.[Employee ID];

go


-- Full OUTER SELF JOIN
-- first (E.Employee Id List ---Matches to---> M.EmployeeID LIST)
-- THEN (E.Employee Id List <---Matches to--- M.EmployeeID LIST)

SELECT	*	--e.Name As Employee, m.Name as Mananger 
FROM		tblEmployee3 e 
Full JOIN	tblEmployee3 m
ON			e.ManagerID= m.[Employee ID];

go



--INNER SELF JOIN
SELECT	*	--e.Name As Employee, m.Name as Mananger 
FROM		tblEmployee3 e 
INNER JOIN	tblEmployee3 m
ON			e.ManagerID= m.[Employee ID];

go

--Cross SELF JOIN
SELECT	*	--e.Name As Employee, m.Name as Mananger 
FROM		tblEmployee3 e 
Cross JOIN	tblEmployee3 m;

go

--WITHOUT USING ON CLAUSE

SELECT	*	--e.Name As Employee, m.Name as Mananger 
FROM		tblEmployee3 e ,tblEmployee3 m
WHERE		e.ManagerID= m.[Employee ID];	



SELECT	*	--e.Name As Employee, m.Name as Mananger 
FROM		tblEmployee3 e ,tblEmployee3 m
WHERE		e.ManagerID != m.[Employee ID];					  
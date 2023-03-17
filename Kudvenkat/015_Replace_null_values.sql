/*
	DIFFERENT WAYS TO REPLACE NULL VALUES:

	1. ISNULL() FUNCTION
	- The ISNULL() function returns a specified value if the expression is NULL.
		-If the expression is NOT NULL, this function returns the expression.
		
		ISNULL(expression, value) 
	
	------------------------------------------------------------------------------------------------------------------------------------
	2. CASE STATEMENT
	- The CASE statement goes through conditions and returns a value when the first condition is met (like an IF-THEN-ELSE statement). 
	- So, once a condition is true, it will stop reading and return the result. 
	- If no conditions are true, it returns the value in the ELSE clause. 
	- CASE Syntax
			
			CASE
				WHEN condition1 THEN result1
				WHEN condition2 THEN result2
				WHEN conditionN THEN resultN
				ELSE result
			END; 
	
	
	
	---------------------------------------------------------------------
	3. COALESCE() FUNCTION
	- The COALESCE() function returns the first non-null value in a list.
	- Syntax
		
		COALESCE(val1, val2, ...., val_n)
	
	- EXAMPLE:
		SELECT COALESCE(NULL, 1, 2, 'W3Schools.com');
*/

USE Sample

GO


-- CREATE EMPLOYEE TABLE WITH MANAAGER ID
 CREATE TABLE tblEmployee3	([Employee ID] INT PRIMARY KEY IDENTITY,
							 Name  nvarchar(30),
							 ManagerID  int);

-- check table information
exec sp_help tblEmployee3;


--insert data into tblEmployee3 Table
INSERT INTO tblEmployee3(Name,ManagerID)
VALUES	('Mike', 3),
		('Rob', 1),
		('Todd', Null),
		('Ben', 1),
		('Sam', 1);

select * from tblEmployee3;	

GO



-- ISNULL(EXPRESSION, REPLACEMENT_VALUE)

SELECT ISNULL(NULL,'SUPERBOSS') AS MANAGER;

GO

--COALESCE()
SELECT COALESCE(NULL,'SUPERBOSS') AS MANAGER;

GO



-- REPLACE NULL VALUE TO CUSTOM VALUE
-- 1. ISNULL()
SELECT		e.Name As Employee, ISNULL(m.Name, 'No Manager') as Mananger 
FROM		tblEmployee3 e 
LEFT JOIN	tblEmployee3 m
ON			e.ManagerID= m.[Employee ID];

go

-- 2. COALESCE()
SELECT		e.Name As Employee, COALESCE(m.Name, 'No Manager') as Mananger 
FROM		tblEmployee3 e 
LEFT JOIN	tblEmployee3 m
ON			e.ManagerID= m.[Employee ID];

go

-- 3. CASE STATEMENT
SELECT		e.Name As Employee, CASE 
									WHEN m.Name IS NULL 
										THEN 'No Manager' 
									ELSE m.Name 
								END 
									as Mananger 
FROM		tblEmployee3 e 
LEFT JOIN	tblEmployee3 m
ON			e.ManagerID= m.[Employee ID];

go

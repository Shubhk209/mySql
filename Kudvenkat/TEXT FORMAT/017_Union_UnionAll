/*
		UNION AND UNION ALL 
		- OPERATORS USED TO COMBINED THE RESULT SET OF TWO OR MORE TABLE SELECT QUERIES.


		NOTE: 
		FOR UNION AND UNION ALL TO WORK :
				- THE NUMBER
				- DATA TYPE
				- AND ORDER OF THE COLUMNS IN THE SELECT STATEMENT
					-SHOULD BE SAME.
					

		UNION
		- Remove duplicates rows
		- Perform distinct sort to remove duplicates rows
			- makes it less faster than UNION ALL


		UNION ALL
		- Doesnot remove duplicate rows
		- Does not perform distinct sort to removoe duplicates rows 
			- which makes it faster than the UNION.
		
		 ------------------------------------------------
		|NOTE: ESTIMATED QUERY EXECUTION PLAN - CTRL + L |
		 ------------------------------------------------


		 SORTING RESULTS OF A UNION OR UNION ALL 
		 - ORDER BY CLAUSE SHOULD BE USED ON THE LAST SELECT STATEMENT IN THE UNION QUERY.
			- ELSE GET ERROR:
				 Incorrect syntax near the keyword 'UNION'.


		
		DIFFERENCE BETWEEN UNION AND UNION ALL
		
		UNION
		- COMBINES THE RESULT SET OF TWO OR MORE SELECT QUERIES INTO A SINGLE RESULT SET.
			- ALL ROWS FROM ALL THE QUERIES IN THE UNION.
		- IT COMBINES ROWS FROM 2 OR MORE TABLES.
		
		JOIN
		- RETRIEVE DATA FROM TWO OR MORE TABLES BASED ON LOGICAL RELATIONSHIP(PK AND FK) BETWEEN THE TABLES.
		- IT COMBINES COLUMN TWO OR MORE TABLES.

*/
go

-- create database Sample
-- use Sample
go

CREATE TABLE tblIndianCustomers (ID int identity,
								NAME nvarchar(20),
								EMAIL nvarchar(40)
								);

INSERT INTO tblIndianCustomers(NAME, EMAIL)
VALUES	('Raj', 'raj@raj.com'),
		('Sham', 'sham@sham.com');
	
	
CREATE TABLE tblUkCustomers (ID int identity,
								NAME nvarchar(20),
								EMAIL nvarchar(40)
								);
								
								
INSERT INTO tblUkCustomers(NAME, EMAIL)
VALUES	('Ben', 'ben@ben.com'),
		('Sham', 'sham@sham.com');	

--update tblUkCustomers set Name= 'Ben', EMAIL='ben@ben.com' where id =1;
	
Select * from tblIndianCustomers;
select * from tblUkCustomers;
go



--UNION

Select ID, NAME ,EMAIL from tblIndianCustomers
UNION
Select ID, NAME ,EMAIL from tblUkCustomers		


--UNION ALL
Select ID, NAME ,EMAIL from tblIndianCustomers
UNION ALL
Select ID, NAME ,EMAIL from tblUkCustomers



-- SORT THE UNION RESULT
Select ID, NAME ,EMAIL from tblIndianCustomers
UNION all
Select ID, NAME ,EMAIL from tblUkCustomers	
oRDER BY NAME								
/*
	TEMPORARY TABLE (TEMP TABLE)
	- Similar to the permanent tables.
	- Permanent tables get created in the database in we specify and remain in the database permanently until we delete(DROP)it.
	- Temporary table get created in the TempDB and automatically deleted when they are no longer used.


	Types of Temporary table
	------------------------
	1. Local Temporary table
	2. Global Temporary table.

	CHECK IF THE LOCAL TEMPORARY TABLE IS CREATED 
	---------------------------------------------
	- It is created in tempdb.
	- Query the sysobjects system table in TempDB.
		- The name of the table, is suffixed with lot if underscores and a random number.
	- For this reason we have to use the LIKE operator in the Query 

		SELECT name from tempdb.sysobjects where name like 'PersonDetails'

	- * A local temporary table is available, only for the connection (Query editor window) that has created the table.
	- * It is automatically dropped, when the connection (Query editor window) that has created is closed

	- It is also possible to for different connections, to create a local temporary table with the same name.
	- For example User1 and User2, both can create a local temporary table with the same name #PersonDetails

	Behaviour of Temporary table with Store Procedure
	--------------------------------------------------

	- If temporary table is created inside the STORE PROCEDURE, 
		- it get's dropped automatically upon the completion of stored procedure execution.
		

	-------------------------------------------------------------------------------------------------------------

	Global Temporary table
	----------------------

	- Prefix the name with 2 Pound symbols (##) while creating GLOBAL TEMPORARY TABLE
	
		CREATE TABLE ##EmployeeDetails (Id int, Name nvarchar(20))
		
	- It is visible to all connection of the sql server, and are only destroyed when the last connection referencing the table is close.
	
	- Mutliple user across multiple connection can have LOCAL TEMPORARY TABLE with the same name, but, 
	- Global temporary table name has to be unique,  and if you inspect the same global temp table in the object explorer, 
		- there will no random numbers suffixed at the end of the table name.		  

	----------------------------------------------------------------------------------------------------------------------------
	
	
	Difference between local and Global Temp Table
	----------------------------------------------

	1. Local Temp tables are prefixed with single pound(#) symbols.
	- Global temp table are prefixed with 2 pound (##) symbols.
	
	2. Sql server appends some random numbers at the end of the local temp table name.(#TempTableName________3243849)
	- This is not done for global temp table names.


	3. Local temporary table are only visible to that session of the SQL server which it created.
	- Global Temporary tables are visible to all SQL server sessions.

	4. Local temporary table are automatically dropped, when the session that created temporary table is closed.
	- Global Temporary table are destroyed when the last connection that is referencing the global temp table is closed.





	-----------------------------------------------------------------------------------------------------------------------------
	NOTE:
	TO CHECK Temporary Table IN SQL
	- OBJECT EXPLORER > DATABASES > System Databases > tempdb > Temporary Table > table_name

	- Using query
		SELECT name from tempdb.sysobjects where name like 'PersonDetails'
*/
go


--Prerequisite


go



------------------------------------
--- Create Local Temporary table ---
------------------------------------
CREATE TABLE #PersonDetails (Id int, Name nvarchar(20))


-- Insert Data into the temporary table
Insert into #PersonDetails (Id,Name)Values(1, 'Ram'); 
Insert into #PersonDetails (Id,Name)Values(2, 'Sham'); 
Insert into #PersonDetails (Id,Name)Values(3, 'Raj'); 



Select * from #PersonDetails

go

-- TO check if local temporary table is created.
SELECT name from tempdb..sysobjects where name like '#PersonDetails%'
go


-- Drop the  local temporary table manually.(explicitly)
DROP TABLE #PersonDetails;
GO


-- Behaviour of Temporary table with Store Procedure

-- Create a store Procedure

CREATE PROCEDURE spCreateLocalTempTable
as 
Begin
	-- Create Temp table
	CREATE TABLE #PersonDetails2 (Id int, Name nvarchar(20))


	-- Insert Data into the temporary table
	Insert into #PersonDetails2 (Id,Name)Values(1, 'Ram'); 
	Insert into #PersonDetails2 (Id,Name)Values(2, 'Sham'); 
	Insert into #PersonDetails2 (Id,Name)Values(3, 'Raj');

	Select * from #PersonDetails2
END

go

-- invoke store procedute and check the Temp table in tempdb with query

EXEC spCreateLocalTempTable		-- 3 record showing

-- check temporary table in db
 select name from tempdb..sysobjects where name like 'PersonDetails2%'		-- no record 


-- Proved : Local Temporary table inside Store procedure get's dropped automatically upon the completion of stored procedure execution.
go



-------------------------------------
--- Create Global Temporary table ---
-------------------------------------
CREATE TABLE ##EmployeeDetails (Id int, Name nvarchar(20))


-- Insert Data into the temporary table
Insert into ##EmployeeDetails (Id,Name)Values(1, 'Ram'); 
Insert into ##EmployeeDetails (Id,Name)Values(2, 'Sham'); 
Insert into ##EmployeeDetails (Id,Name)Values(3, 'Raj'); 



Select * from ##EmployeeDetails


-- It is not possible to dupicate Global temp table in other connection as Local Temporary table
go


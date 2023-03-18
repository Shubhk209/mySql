/*
	Collations in SQL Server provide sorting rules, case, and accent sensitivity properties to data. 
	A collation defines bit patterns that represent each character in metadata of database. 
	SQL Server supports storing objects that have different collations in database.

*/

USE TempDB
GO
-- Sample Data Building
CREATE TABLE ColTable
(Col1 VARCHAR(15) COLLATE Latin1_General_CI_AS,
Col2 VARCHAR(14) COLLATE Latin1_General_CS_AS) ;
INSERT ColTable(Col1, Col2)
VALUES ('Apple','Apple'),
('apple','apple'),
('pineapple','pineapple'),
('Pineapple','Pineapple');
GO

-- Retrieve Data
SELECT *
FROM ColTable
GO

-- Retrieve Data
SELECT *
FROM ColTable
ORDER BY Col1
GO

-- Retrieve Data
SELECT *
FROM ColTable
ORDER BY Col2
GO

/*
	While fetching data from above query, 
	As column 2 is case sensitive our result is definitely
	changed lower case apple has come first an upper case Apple has came afterwards

	So it's very important developer selects the right coalition for their database
*/

-- Clean up
DROP TABLE ColTable
GO
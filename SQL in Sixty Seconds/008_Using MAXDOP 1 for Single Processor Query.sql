/*
	There are always few queries which gives optimal performance when they are executed on single processor 
	and there are always queries which gives optimal performance when they are executed on multiple processors.
*/


﻿
USE AdventureWorks2019 
GO


-- Parallel Query SELECT *
select * 
FROM [Sales].[SalesOrderHeader] soh 
INNER JOIN [Sales]. [SalesOrderDetail] sod 
	ON sod.SalesOrderID = soh. SalesOrderID
OPTION (MAXDOP 1)



-- Parallel Query SELECT *
Select *
FROM [Sales].[SalesOrderHeader] soh
INNER JOIN [Sales]. [SalesOrderDetail] sod
	ON sod.SalesOrderID = soh. SalesOrderID
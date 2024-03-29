/*
	How many users created tables are there in the database?
	How many non clustered indexes each of the tables in the database have?
	Is table Heap or has clustered index on it?
	How many rows each of the tables is contained in the database?
*/

SELECT	[schema_name] = s.name, 
		table_name = o.name,
		MAX(i1.type_desc) ClusteredIndexorHeap,
		MAX(COALESCE(i2.NCIC,0)) NoOfNonClusteredIndex,
		p.rows
FROM sys.indexes si 
RIGHT JOIN sys.objects o ON si.[object_id] = o.[object_id]
INNER JOIN sys.schemas s ON o.[schema_id] = s.[schema_id]
LEFT JOIN sys.partitions p ON p.OBJECT_ID = o.OBJECT_ID AND p.index_id IN (0,1)
LEFT JOIN sys.indexes i1 ON si.OBJECT_ID = i1.OBJECT_ID AND i1.TYPE IN (0,1)
LEFT JOIN (SELECT object_id,COUNT(Index_id) NCIC
FROM sys.indexes
WHERE type = 2
GROUP BY object_id) I2
ON si.OBJECT_ID = i2.OBJECT_ID
WHERE o.TYPE IN ('U')
GROUP BY s.name, o.name, p.rows
ORDER BY schema_name, table_name
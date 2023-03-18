/*
During performance tuning conversation the very first question people often ask is 
what are the queries offending the server or in another word let us identify the queries which are the most resource intensive. 

The resources are often described as either Memory, CPU or IO. When we talk about the queries the same is applicable for them as well. 
The query which is doing lots of reads or writes are for sure resource intensive as well query which are taking maximum CPU time.

Performance tuning is a very deep subject and we all have our own preference regarding what should be the first step to tuning 
and what should be looked with the salt of grain. Though there is no denying that a query which uses more resources 
than what it should be using for sure require tuning. 

There are many ways to do identify query using intense resources (e.g. Extended events etc) but in this one we will go by simple DMV.
*/

SELECT TOP 10 SUBSTRING(qt.TEXT, (qs.statement_start_offset/2)+1,
(
	(
		CASE qs.statement_end_offset
		WHEN -1 THEN DATALENGTH(qt.TEXT)
		ELSE qs.statement_end_offset
		END - qs.statement_start_offset)/2)+1
	),
	qs.execution_count,
	qs.total_logical_reads, qs.last_logical_reads,
	qs.total_logical_writes, qs.last_logical_writes,
	qs.total_worker_time,
	qs.last_worker_time,
	qs.total_elapsed_time/1000000 total_elapsed_time_in_S,
	qs.last_elapsed_time/1000000 last_elapsed_time_in_S,
	qs.last_execution_time,
	qp.query_plan
	FROM sys.dm_exec_query_stats qs
	CROSS APPLY sys.dm_exec_sql_text(qs.sql_handle) qt
	CROSS APPLY sys.dm_exec_query_plan(qs.plan_handle
	) qp
ORDER BY qs.total_logical_reads DESC -- logical reads
-- ORDER BY qs.total_logical_writes DESC -- logical writes
-- ORDER BY qs.total_worker_time DESC -- CPU time


/*
	You can change the ORDER BY clause to order this table with different parameters. 

	Note: 
	please note that this query uses DMB which reads the data from cache only it
	will not have record of the query which are resource intensive but not stored in
	the cache or have been removed explicitly from it.
*/

-- Script with Subquery

Select * from 
(
	select 1 as Col1
	Union All
	select 2 as Col1
	Union All
	select 3 as Col1
) As Table1
go


-- Subquery to CTE

;With Table1 AS
(
	select 1 as Col1
	Union All
	select 2 as Col1
	Union All
	select 3 as Col1
) 

-- select 
Select * from Table1
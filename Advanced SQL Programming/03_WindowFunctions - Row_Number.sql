Use AdventureWorks2019

-- Ranking all records within each group of salesOrder IDs.
select  
SalesOrderID,
SalesOrderDetailID,
UnitPriceDiscount,
LineTotal,
[ProductIDLineTotal] = SUM(LineTotal) over(Partition by ProductID,OrderQty),
[Ranking] = ROW_NUMBER() over(Partition by SalesOrderID order by LineTotal desc)
from Sales.SalesOrderDetail
order by SalesOrderID

/*
Row_number() will assign a unique ranking, 
beginning with one to every record within a group, 

Our groups are defined by unique combinations of values 
from all the fields listed in the partitioned by clause
*/


-- Row_Number without partition
select  
SalesOrderID,
SalesOrderDetailID,
UnitPriceDiscount,
LineTotal,
[ProductIDLineTotal] = SUM(LineTotal) over(Partition by ProductID,OrderQty),
[Ranking] = ROW_NUMBER() over(order by LineTotal desc)
from Sales.SalesOrderDetail
order by Ranking


/*
ROW_NUMBER() now treats our entire query output as one giant group 
in which the record with the highest line total.

we look carefully at the very end of our query output, 
There are a number of records which is the exact same 'LineTotal' Value. 

So it turns out that Rowe no uses brute force to deal with these kinds of ties, 
ROW_NUMBER() always returns a sequential series of rankings.

It will randomly assign a rank to records whose values 
in that order by field be specified.

That's where the rank and dence_rank functions come in.
*/



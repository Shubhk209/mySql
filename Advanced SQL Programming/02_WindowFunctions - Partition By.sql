/* 
Fetch Sum of lineTotal
Grouping our salesorder table, detailed data by product_Id 
and Order quantity using traditional aggregate function

*/

select  
ProductID,
OrderQty,
[LineTotal] = SUM(LineTotal)
from Sales.SalesOrderDetail
Group by ProductID,OrderQty

/*
This operation works by creating a group for each unique combination of values 
from all the fields listed in our group by product ID in order quantity.

the aggregate calculation or calculations of our choosing, some count, etc. 
will then be performed over each of these groups. (ProductID,OrderQty)
*/




-- Sum of linesTotal via Over function
select  
ProductID,
SalesOrderID,
SalesOrderDetailID,
OrderQty,
UnitPrice,
UnitPriceDiscount,
[LineTotal] = SUM(LineTotal) over()
from Sales.SalesOrderDetail
order by ProductID,OrderQty



-- Sum of linesTotal via Over function
select  
ProductID,
SalesOrderID,
SalesOrderDetailID,
OrderQty,
UnitPrice,
UnitPriceDiscount,
LineTotal,
[ProductIDLineTotal] = SUM(LineTotal) over(Partition by ProductID,OrderQty)
from Sales.SalesOrderDetail
order by ProductID,OrderQty
/*
every row in our query output with this combination of values 
is simply considered a member of the same group.

the window function is basically returning the sum of line total for each of these rows, 
as our aggregate function did for the entire group.

we are able to perform aggregate calculations on groups within our data.
without losing any road level detail or the flexibility to include any columns we want, and if we want
to add more layers to our groups, it's as easy as tacking on an extra field onto our partition by clause.


*/
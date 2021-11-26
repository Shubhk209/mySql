/*
	What is an indexed view?
	OR
	What happens when we create an index on a view?

-A standard or non-indexed view is just like a stored SQL query.
-When, we try to  retrieve data from the view, the data actually retreived from the underlying base tables.

So, a view is just a virtual table it does not store any data, by default.

- However, When we create an index on a view, the view get materialized.
	- This means, the view is now, capable of storing data.

- In SQL server, we call them INDEXED VIEW and in ORACLE, MATERIALIZED VIEWS.

- Indexed View suitable at places where the data not changed heavily.
	- idle for OLAP system, data warehouse(used for reporting and analysis purpose) where the data not changed frequently.

- Best way to load data when we have view,
	- drops these indexed views and re-created indexed views.

- the Cost of maintaining indexed view is much more than cost of maintaining table indexes.	

- 2 steps to create indexed view
	1. create a view as per below gridlines
	2. create a unique clustered index
	- else when we select the view, database engine need to goes to require base table in view to compute and fetch data everytime.
		


- 4 Guide to create Indexed View (check Below)
	- For complete list of rules, visit : http://msdn.microsoft.com/en-us/ms191432(v=sql.105).aspx






NOTE: 
- The SQL Server ISNULL() function lets you return an alternative value when an expression is NULL.
*/
GO


--Prerequisite

-- create database sample;

use sample
Create table tbl_Products(	productid int primary key,
						Name varchar(20) not null,
						unit_price int 
					)

-- sp_rename 'Products', 'tbl_Products'

insert into tbl_Products (productid,Name,unit_price) values (1,'Books',20),
														(2,'Pens',14),
														(3,'Pencils',11),
														(4,'Clips',10);


select * from tbl_Products



-- create product sold table

Create table tbl_Product_sold (	product_id int not null,
								quantity_sold int not null
								constraint FK_productsold_Products_by_id foreign key(product_id) references tbl_Products(productid)
								);

insert into tbl_Product_sold (product_id, quantity_sold) values
(1,10),
(3,23),
(4,21),
(2,12),
(1,13),
(3,12),
(4,13),
(1,11),
(2,12),
(1,14)


select * from tbl_Product_sold 
go


-- Steps to create Indexed View
-- 1. Create view to find Total sales by product
-- TOTAL SALE= NO OF UNIT SOLD X UNIT PRICE

Create view vWTotalSalesByProduct
with SchemaBinding
as
select Name,
SUM(isnull((ps.quantity_sold * p.unit_price),0)) as [Total Sales]
from dbo.tbl_Product_sold ps join dbo.tbl_Products p
on ps.product_id =p.productid
group by Name


-- The SQL Server ISNULL() function lets you return an alternative value when an expression is NULL.
go

-- check view 
Select * from vWTotalSalesByProduct;
go


--2. Create  a unique Clustered index
CREATE Unique Clustered Index UIX_vWTotalSalesByProduct_Name
on vWTotalSalesByProduct (Name);

-- If we dont create unique clustered index,
	-- view will not store any data, so when we execute select query with view,
	-- the database engine will execute the query statement inside view, means query need to go back to base table and  its has to compute everything.
	-- so everytime we use select query with view, it has to compute those from base tables.

	-- If table is huge, it takes huge time to compute everytime those results.

-- First index we create on view must be unique clustered index

-- after creating unique clustered index, we fetch data from index, it dont have to go to base table to compute that.
-- anytime transaction is made in base table, view also be re-computed and updated.
	

	
-- Indexed View suitable at places where the data not changed heavily.

go













/*
	GuideLines to create a Indexed view so that is can be materialized

	1. The view should be created with SCHEMABINDING OPTIONS
		- we cannot change underline object(tables)  in any way that could affect the SP or VIEW.

	2. If an Aggregates function in the select list, references an expression, and if there is a possibility for the expression to be NULL, then a replacement value should be specified.
		- Using ISNULL function.

	3. If GroupBy is specified, the view select list must contain a Count_Big(*) expression.
	
	4. The base tables in the view, should be referenced with 2 part names.
		- schema_name.tableName
		- dbo.tblProduct

	5. Create a unique clustered index to materialized the table.


*/
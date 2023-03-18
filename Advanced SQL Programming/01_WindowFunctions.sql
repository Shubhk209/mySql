-- Window function 
SELECT	BusinessEntityID
		,TerritoryID
		,SalesQuota
		,Bonus
		,CommissionPct
		,SalesYTD
		,SalesLastYear
		,[Total YID Sales] = Sum(SalesYTD) over ()
		,[MAX YID Sales] = MAX(SalesYTD) over ()
		,[% of Best Performer] = [SalesYTD]/MAX(SalesYTD) over ()
FROM Sales.SalesPerson

-- Aggregate function
SELECT SUM(SalesYTD) as [Total YID Sales], MAX(SalesYTD) as [MAX YID Sales]
--,([SalesYTD]/MAX(SalesYTD)) as [% of Best Performer]
FROM Sales.SalesPerson 


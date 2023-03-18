


Declare @year int = 2012;

SELECT CONCAT(@year, '0201');
SELECT EOMONTH (CONCAT (@year, '0201'));
SELECT DATEPART(dd, (EOMONTH (CONCAT(@year, '0201'))));
-- check if 
SELECT IIF(DATEPART(dd, (EOMONTH(CONCAT(@year, '0201')))) = 29,1,0);

go


-- function to check if year is leap year
alter FUNCTION dbo.IsLeapYear(@year INT)
RETURNS INT
AS
BEGIN
RETURN(IIF (DATEPART(dd, (EOMONTH (CONCAT (@year, '0201')))) = 29,1,0))
END
GO
/*
	Let's validate if the datepart is 29 or not,
	let's run each of this together come catch a last day of the
		February number of the days in Februarya and if it is a leap year or not
*/


SELECT dbo.IsLeapYear ('2011') --'2011 ISNOTLeapYear', return 0 
SELECT dbo.IsLeapYear ('2012') -- '2012 IsLeapYear', return 1
GO
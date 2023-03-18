SELECT GETDATE()
GO
-- SQL Server 2000/2005
SELECT
CONVERT(VARCHAR(8),GETDATE(),108) AS HourMinuteSecond,
CONVERT(VARCHAR(10),GETDATE(),101) AS DateOnly;
GO
-- SQL Server 2008 Onwards
SELECT CONVERT(TIME,GETDATE()) AS HourMinuteSeconds;
SELECT CONVERT(DATE,GETDATE()) AS DateOnly;
GO



/*	Get Current Time Zone	*/




-- Fetch the timezone on the current server date configuration in which Sql server installed.
SELECT CURRENT_TIMEZONE();
go


-- Returns a datetimeoffset(7) value that contains the date and time of the computer on which the instance of SQL Server is running. 
-- The time zone offset is included.
SELECT SYSDATETIMEOFFSET();

select SYSDATETIME()		--2023-03-18 13:10:02.0474381
select SYSDATETIMEOFFSET()	--2023-03-18 13:10:02.0474381 -07:00
select SYSUTCDATETIME()		--2023-03-18 20:10:02.0474381
select CURRENT_TIMESTAMP	--2023-03-18 13:10:02.047
select GETDATE()			--2023-03-18 13:10:02.047
select GETUTCDATE()			--2023-03-18 20:10:02.047

go


-- Check all supporting time zone in Sql server 2019
SELECT [name], current_utc_offset,is_currently_dst
FROM sys.time_zone_info;
go




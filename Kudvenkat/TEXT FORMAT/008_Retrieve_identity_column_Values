-- How to retrieve the last generated identity column value
--Difference bewteen SCOPE_IDENTITY(), @@Identity and IDENT_CURRENT('TableName').


/*

	SCOPE_IDENTITY()
	- Function 
	- commonly used
	- use to retrieve last generated identity column value
		- from same session(current query tab) and within same scope
	- Same session and the same scope
	

	@@Identity
	- Global Variable 
	- use to retrieve last generated identity column value
		- from same session(current query tab) and across any scope

	IDENT_CURRENT('TABLENAME')
	- Function  
	- Parameter: takes a table name
	- use to retrieve last generated identity column value specific table with its name
		-across any session and any scope.
	
	note:
	-SESSION : connection to sql server
		- using query tab
*/


use Sample
go



Create table test1	
(
ID int identity(1,1),
Value nvarchar(20)	
);


Create table test2	
(
ID int identity(1,1),
Value nvarchar(20)	
);


insert into test1 values ('x');

insert into test1 values ('y');

insert into test1 values ('z');

select * from test1;
select * from test2;

go

-- CREATE A TRIGGER ON test1
Create trigger trForInsert
on test1
for insert 
as 
begin 
	insert into Test2 values('yyyy');
end


go




-- to retreive last generated identity value

-- 1. FUNCTION
SELECT SCOPE_IDENTITY();

-- 2. GLOBAL VARIABLE
SELECT @@IDENTITY

-- 3. Function - Specific table across any session and any scope.
SELECT IDENT_CURRENT('test1');

SELECT IDENT_CURRENT('test2');

go

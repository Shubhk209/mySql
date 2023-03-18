/*
	T- Sql Contructs
*/


-- Declaration and intialization

-- Pre Sql 2005
Declare @counter int
set @counter = 1
select @counter [counter]
go

/*
	 In sequence of 2005 addition the way you could declare a variable 
	 and set its value then we could work on the variable.
*/


-- Pre Sql 2008
Declare @counter int = 1
select @counter [counter]
go

/*
	 In sequence of 2008,  declaring and initializing a default value in one
	 single statement this means if I execute these two sentences in one statement.
*/
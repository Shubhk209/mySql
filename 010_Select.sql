/*
	Selecting specific or all column
	- GUI -> right click on table --> Script table as --> Select To --> New Query ditor Window
	- Script
		Select * From <Table Name>

		OR

		SELECT * FROM [<DATABASE_NAME>].[<schema name>].[<TAble_name>]


	Distinct Rows
	- select Unqiue row data 
	- ignore duplicates


	Operators

		Operator		Purpose
		
			=			Equal to
		!= OR <>		Not Equal to
			>			Greater Than
			>=			Greater THan or equal to
			<			Less Than
			<=			Less Than OR equal to
			IN			specify a list of values
			BETWEEN		specify a range
			LIKE		specify a pattern
			NOT			Not in a list, range, etc...
	
	
	WildCard
		
				Operator		Purpose
					%			specifies zero or more characters
	   (underscore) _			specifies exactly one character
					[]			any character within the brackets
					[^]			Not any character with in the bracket


	Sort rows using order by
	- using order by clause
	- if there are duplicate in column we sort
		- than we can sort the dupliicate with using other column name while selecting



	Selecting top n or top n percentage of row
	- to select  top n number of records
	- using TOP clause

	- top n percent
		Select TOP 1 PERCENT * from tblPerson;
	 
*/
USE Sample
go

Create table tblGender ( Id int not null,
						Gender nvarchar(15)
						);

Insert into tblGender (Id, Gender) 
values	(1, 'Male'),
		(2, 'Female'),
		(3, 'Other');



Select * from tblGender;

exec sp_help tblGender;

Create table tblPerson3 (id int identity not null,
						Name nvarchar(30),
						Email nvarchar(50),
						GenderId int not null,
						Age int not null,
						City nvarchar(30)
						foreign key (GenderId) References tblGender (Id),
						CHECK (Age>=18)
						);

Insert into tblPerson (Id, Name,Email,GenderId, Age, City) 
values	('Tom','t@t.com',1,23,'London'),
		('John','j@j.com',1,25,'New York'),
		('Mary','ma@ma.com',2,19,'Sydney'),
		('John','jn@jn.com',1,29,'London'),
		('Sara','sa@sa.com',2,25,'Mumbai');

Select * from tblPerson
		
go




-- Selecting specific or all column
Select * from [Sample].[dbo].[tblPerson]

--OR

SELECT [ID]
      ,[Name]
      ,[Email]
      ,[GenderId]
  FROM [Sample].[dbo].[tblPerson]
GO



-- Distinct Row

Select Distinct Name  from tblPerson;

go

-- Filter the data 

Select Name ,Email
from tblPerson
where Email like '%gmail.com' 

Select Name ,Email
from tblPerson
where Email not like '%gmail.com';

Select Name ,Email
from tblPerson
where Email not like '_@%';

Select Name ,Email
from tblPerson
where Email  like '_@%';

Select Name ,Email
from tblPerson
where Email  like '[jmr]%';

Select Name ,Email
from tblPerson
where Email  like '[^jmr]%';


Select Name ,GenderId
from tblPerson
where GenderId IN (1,2);

Select Name,GenderId
from tblPerson
where GenderId NOT IN (1);

Select Name,ID
from tblPerson
Where ID Between 3 AND 7;

go


--Sort row 

Select Name ,Email
from tblPerson
order by Name;

Select Name ,Email
from tblPerson
order by Name DESC;

go


--Selecting top n or top n percentage of row

Select Top 3 * from tblPerson;

Select TOP 1 PERCENT * from tblPerson;

Select TOP 10 PERCENT * from tblPerson;

Select TOP 20 PERCENT * from tblPerson;

Select TOP 40 PERCENT * from tblPerson;
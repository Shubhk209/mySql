/*

	4 Thing to need for connect to local Sql Server
	
	1.Server Type= Data Base Engine
		- specify the Server type to connect
		- Database Engine(by default), SSAS(Analysis Services), SSRS(Reporting Services),SSIS(Integration service)

	2.Server Name=
		-if both my database and management studio in same machine  
			-specify the loopback ip address(127.0.0.1) of my local machine
			-'.' specify that i want to connect local server
			-(local) keyword

	3. Authentication:	Specify how do we want to connect to db server. 
						Option(s) depends on how we configure sql server during installation.
						Mixed Mode allow us to connect with db server with both options given below.
		
		- SQL Server Authentication: It uses username(sa) and password we specified during installation. 
		- Windows Authentication: It uses windows login to connect the sql server.




	Sql Server- Typically contain all the table and data
	SSMS- it is a client tool and not the server by itself.
		- Developer machine (clients) connects to Sql Server using SSMS. 

*/
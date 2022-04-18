use bookcatalog
go
--insert authors data uisng procedure spInsertAuthor
DECLARE @id INT
EXEC spInsertAuthor 'McDonnel', null, @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertAuthor 'J Finn', 'jf@aol.com', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertAuthor 'M Sammuels', null, @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertAuthor 'Mari Vega', null, @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertAuthor 'J Sharp', 'jsharp@mega.con.nz', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertAuthor 'K Watson', 'jkwatsonp@megamail.com', @id OUTPUT
SELECT @id as 'inserted with id'
GO
SELECT * FROM authors
GO
-- update author using spUpdateAuthor
EXEC spUpdateAuthor @authorid=1, @email = 'mc@gmail.com'
EXEC spUpdateAuthor @authorid=4, @email = 'mvega@gmail.com'
EXEC spUpdateAuthor 3,'Mathew Sammules','sam@gmail.com'
GO
SELECT * FROM authors
GO
-- update author using spDeleteAuthor
EXEC spDeleteAuthor 6, 1
GO
SELECT * FROM authors
GO
--Insert tag using spInsertTag
DECLARE @id INT
EXEC spInsertTag 'Programming', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertTag '.NET', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertTag 'C#', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertTag 'Database', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertTag 'SQL Server', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertTag 'ASP', @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertTag 'ASP.NET', @id OUTPUT
SELECT @id as 'inserted with id'
GO
SELECT * FROM tags
GO
--Update tag using spUpdateTag
EXEC spUpdateTag 5, 'SQL Server 2016'
GO
SELECT * FROM tags
GO
EXEC spDeleteTag 7
GO
SELECT * FROM tags
GO
--insert publish data uisng procedure spInsertPublisher
DECLARE @id INT
--EXEC spInsertPublisher 'Wrox publishing',null,  @id OUTPUT
--SELECT @id as 'inserted with id'
EXEC spInsertPublisher 'APres',null,  @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertPublisher 'MPress',null,  @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertPublisher 'Wielley',null,  @id OUTPUT
SELECT @id as 'inserted with id'
EXEC spInsertPublisher 'Manning',null,  @id OUTPUT
SELECT @id as 'inserted with id'
GO
SELECT * FROM publishers
GO
--update publisher using spUpdatePublisher
EXEC spUpdatePublisher 5, 'Manning Inc',';sales@manning.com'
GO
SELECT * FROM publishers
GO
--Insert data using spInsertBook
EXEC spInsertBook @title ='C# Fundamental',
		@price = 59.99,
		@available = 1, 
		@publishdate ='2021-07-11',
		@publisherid=1,
		@tags = 'Programming, C#, .NET',
		@authors = '1, 2'
EXEC spInsertBook @title ='SQL Programming',
		@price = 59.99,
		@available = 1, 
		@publishdate ='2021-07-11',
		@publisherid=1,
		@tags = 'SQL Server 2016',
		@authors = '3'
EXEC spInsertBook @title ='Laravel',
		@price = 59.99,
		@available = 1, 
		@publishdate ='2021-07-11',
		@publisherid=1,
		@tags = 'PHP, Laravel',
		@authors = '5'
GO
SELECT *FROM books
SELECT * FROM bookauthors
SELECT * FROM booktags
GO
--View
SELECT * FROM vBookWithDeatils
GO
SELECT * FROM vAuthoBookCount
GO
--Test UDF
SELECT dbo.fnBooksPublished(2017)
GO
SELECT * FROM fnBooksUnderTag('C#')
--Test Tigger
--Will fails for trggers
exec spDeletePublicher 1
GO
SELECT * FROM publishers
GO
exec spDeletePublicher 2
GO
SELECT * FROM publishers
GO
SELECT * FROM books
GO
--Test author delete trigger
delete FROM authors where authorid=1
--Test publisher delete trigger
delete FROM publishers where publisherid=1
--Test tags delete trigger
SELECT * FROM tags
SELECT * FROM booktags
GO
delete FROM tags where tagid=3
GO
SELECT * FROM tags
SELECT * FROM booktags
GO

ALTER ROLE [db_owner] ADD MEMBER [DataLakeUser];


GO
ALTER ROLE [db_datareader] ADD MEMBER [DataLakeUser];


GO
ALTER ROLE [db_datawriter] ADD MEMBER [DataLakeUser];


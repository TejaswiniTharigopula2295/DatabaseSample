CREATE EXTERNAL TABLE [dbo].[AspNetUsersHistory] (
    [AspNetUsersHistoryGuid] UNIQUEIDENTIFIER NULL,
    [AspNetUsersGuid] UNIQUEIDENTIFIER NULL,
    [GroupingGuid] UNIQUEIDENTIFIER NULL,
    [TableColumnName] NVARCHAR (100) NULL,
    [BeforeText] NVARCHAR (1000) NULL,
    [AfterText] NVARCHAR (1000) NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'AspNetUsersHistory'
    );


CREATE EXTERNAL TABLE [dbo].[SalesOrderHistory] (
    [SalesOrderHistoryGuid] UNIQUEIDENTIFIER NULL,
    [SalesOrderGuid] UNIQUEIDENTIFIER NULL,
    [SalesOrderHistoryTypeValue] INT NULL,
    [PropertyName] NVARCHAR (100) NULL,
    [ValueBeforeText] NVARCHAR (1000) NULL,
    [ValueAfterText] NVARCHAR (1000) NULL,
    [OrderLogText] NVARCHAR (1000) NULL,
    [GroupGuid] UNIQUEIDENTIFIER NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'SalesOrderHistory'
    );


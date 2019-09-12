CREATE EXTERNAL TABLE [dbo].[SalesOrderStoredFile] (
    [StoredFileGuid] UNIQUEIDENTIFIER NULL,
    [SalesOrderGuid] UNIQUEIDENTIFIER NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [SalesOrderRecordTypeValue] INT NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'SalesOrderStoredFile'
    );


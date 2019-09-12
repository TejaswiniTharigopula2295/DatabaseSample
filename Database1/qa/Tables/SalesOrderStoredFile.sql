CREATE TABLE [qa].[SalesOrderStoredFile] (
    [StoredFileGuid]            VARCHAR (256)  NULL,
    [SalesOrderGuid]            VARCHAR (256)  NULL,
    [CreateUtc]                 DATETIME2 (7)  NULL,
    [CreateUserGuid]            VARCHAR (256)  NULL,
    [CreateProgramName]         NVARCHAR (100) NULL,
    [SalesOrderRecordTypeValue] INT            NULL,
    [ProcessedDateTime]         DATETIME       NOT NULL
);


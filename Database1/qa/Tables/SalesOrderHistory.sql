CREATE TABLE [qa].[SalesOrderHistory] (
    [SalesOrderHistoryGuid]      VARCHAR (256)   NULL,
    [SalesOrderGuid]             VARCHAR (256)   NULL,
    [SalesOrderHistoryTypeValue] INT             NULL,
    [PropertyName]               NVARCHAR (100)  NULL,
    [ValueBeforeText]            NVARCHAR (1000) NULL,
    [ValueAfterText]             NVARCHAR (1000) NULL,
    [OrderLogText]               NVARCHAR (1000) NULL,
    [GroupGuid]                  VARCHAR (256)   NULL,
    [CreateUtc]                  DATETIME2 (7)   NULL,
    [CreateUserGuid]             VARCHAR (256)   NULL,
    [CreateProgramName]          NVARCHAR (100)  NULL,
    [ProcessedDateTime]          DATETIME        NOT NULL
);


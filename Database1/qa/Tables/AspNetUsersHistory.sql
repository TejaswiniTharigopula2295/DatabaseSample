CREATE TABLE [qa].[AspNetUsersHistory] (
    [AspNetUsersHistoryGuid] VARCHAR (256)   NULL,
    [AspNetUsersGuid]        VARCHAR (256)   NULL,
    [GroupingGuid]           VARCHAR (256)   NULL,
    [TableColumnName]        NVARCHAR (100)  NULL,
    [BeforeText]             NVARCHAR (1000) NULL,
    [AfterText]              NVARCHAR (1000) NULL,
    [CreateUtc]              DATETIME2 (7)   NULL,
    [CreateUserGuid]         VARCHAR (256)   NULL,
    [CreateProgramName]      NVARCHAR (100)  NULL,
    [ProcessedDateTime]      DATETIME        NOT NULL
);


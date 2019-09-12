CREATE TABLE [qa].[SalesOrderProduct] (
    [SalesOrderGuid]    VARCHAR (256)  NULL,
    [ProductCodeValue]  INT            NULL,
    [ProductQuantity]   INT            NULL,
    [ChangeUtc]         DATETIME2 (7)  NULL,
    [ChangeUserGuid]    VARCHAR (256)  NULL,
    [ChangeProgramName] NVARCHAR (100) NULL,
    [CreateUtc]         DATETIME2 (7)  NULL,
    [CreateUserGuid]    VARCHAR (256)  NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [ProcessedDateTime] DATETIME       NOT NULL
);


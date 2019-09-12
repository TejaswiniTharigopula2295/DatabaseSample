CREATE EXTERNAL TABLE [dbo].[SalesOrderProduct] (
    [SalesOrderGuid] UNIQUEIDENTIFIER NULL,
    [ProductCodeValue] INT NULL,
    [ProductQuantity] INT NULL,
    [ChangeUtc] DATETIME2 (7) NULL,
    [ChangeUserGuid] UNIQUEIDENTIFIER NULL,
    [ChangeProgramName] NVARCHAR (100) NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'SalesOrderProduct'
    );


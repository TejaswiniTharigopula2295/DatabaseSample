CREATE EXTERNAL TABLE [dbo].[CodeProduct] (
    [ProductCodeValue] INT NULL,
    [ProductName] NVARCHAR (20) NULL,
    [ProductDescription] NVARCHAR (100) NULL,
    [SortOrder] SMALLINT NULL,
    [IsActive] BIT NULL,
    [IsDefault] BIT NULL,
    [LocalizationGuid] UNIQUEIDENTIFIER NULL,
    [ArchValue] INT NULL,
    [ArchTreatmentValue] INT NULL,
    [ProcessTypeValue] INT NULL,
    [ProductSourceTypeValue] INT NULL,
    [ChangeUtc] DATETIME2 (7) NULL,
    [ChangeUserGuid] UNIQUEIDENTIFIER NULL,
    [ChangeProgramName] NVARCHAR (100) NULL,
    [OrderInfoVersion] INT NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'CodeProduct'
    );


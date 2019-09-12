CREATE EXTERNAL TABLE [dbo].[EnumModelType] (
    [ModelTypeValue] INT NULL,
    [ModelTypeName] NVARCHAR (20) NULL,
    [ModelTypeDescription] NVARCHAR (100) NULL,
    [SortOrder] SMALLINT NULL,
    [IsActive] BIT NULL,
    [IsDefault] BIT NULL,
    [LocalizationGuid] UNIQUEIDENTIFIER NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'EnumModelType'
    );


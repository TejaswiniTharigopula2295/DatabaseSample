CREATE EXTERNAL TABLE [dbo].[EnumOrderType] (
    [OrderTypeValue] INT NULL,
    [OrderTypeName] NVARCHAR (20) NULL,
    [OrderTypeDescription] NVARCHAR (100) NULL,
    [SortOrder] SMALLINT NULL,
    [IsActive] BIT NULL,
    [IsDefault] BIT NULL,
    [LocalizationGuid] UNIQUEIDENTIFIER NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'EnumOrderType'
    );


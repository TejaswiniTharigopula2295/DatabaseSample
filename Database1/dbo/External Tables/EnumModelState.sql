CREATE EXTERNAL TABLE [dbo].[EnumModelState] (
    [ModelStateValue] INT NULL,
    [ModelStateName] NVARCHAR (20) NULL,
    [ModelStateDescription] NVARCHAR (100) NULL,
    [SortOrder] SMALLINT NULL,
    [IsActive] BIT NULL,
    [IsDefault] BIT NULL,
    [LocalizationGuid] UNIQUEIDENTIFIER NULL,
    [IsViewable] BIT NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'EnumModelState'
    );


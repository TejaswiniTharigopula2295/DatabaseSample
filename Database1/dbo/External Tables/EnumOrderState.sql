CREATE EXTERNAL TABLE [dbo].[EnumOrderState] (
    [OrderStateValue] INT NULL,
    [OrderStateName] NVARCHAR (20) NULL,
    [OrderStateDescription] NVARCHAR (200) NULL,
    [SortOrder] SMALLINT NULL,
    [IsActive] BIT NULL,
    [IsDefault] BIT NULL,
    [LocalizationGuid] UNIQUEIDENTIFIER NULL,
    [IsExternalActionRequired] BIT NULL,
    [IsInternalActionRequired] BIT NULL,
    [VisualIndicatorCode] NVARCHAR (10) NULL,
    [IsQcPrescriptionActionRequired] BIT NULL,
    [QcPrescriptionVisualIndicatorCode] NVARCHAR (10) NULL,
    [InternalVisualIndicatorIconValue] INT NULL,
    [ExternalVisualIndicatorIconValue] INT NULL,
    [QcVisualIndicatorIconValue] INT NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'EnumOrderState'
    );


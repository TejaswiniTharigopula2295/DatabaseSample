CREATE EXTERNAL TABLE [dbo].[EnumGenOrderStateOrderType] (
    [OrderStateValue] INT NULL,
    [OrderStateName] NVARCHAR (20) NULL,
    [OrderStateDescription] NVARCHAR (200) NULL,
    [StateSortOrder] SMALLINT NULL,
    [IsExternalActionRequired] BIT NULL,
    [IsInternalActionRequired] BIT NULL,
    [VisualIndicatorCode] NVARCHAR (10) NULL,
    [IsQcPrescriptionActionRequired] BIT NULL,
    [QcPrescriptionVisualIndicatorCode] NVARCHAR (10) NULL,
    [Value] NVARCHAR (200) NULL,
    [OrderTypeValue] INT NULL,
    [OrderTypeName] NVARCHAR (20) NULL,
    [OrderTypeDescription] NVARCHAR (100) NULL,
    [TypeSortOrder] SMALLINT NULL,
    [IsReportedToAPlus] BIT NULL,
    [IsActiveOrderState] BIT NULL,
    [InternalVisualIndicatorIconValue] INT NULL,
    [ExternalVisualIndicatorIconValue] INT NULL,
    [QcVisualIndicatorIconValue] INT NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'EnumGenOrderStateOrderType'
    );


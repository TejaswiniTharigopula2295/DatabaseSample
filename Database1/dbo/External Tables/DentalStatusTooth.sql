CREATE EXTERNAL TABLE [dbo].[DentalStatusTooth] (
    [DentalStatusToothGuid] UNIQUEIDENTIFIER NULL,
    [DentalStatusHistoryGuid] UNIQUEIDENTIFIER NULL,
    [ToothValue] INT NULL,
    [IsSupernumerary] BIT NULL,
    [IsMissing] BIT NULL,
    [IsToBeExtracted] BIT NULL,
    [IsPrimary] BIT NULL,
    [IsFixed] BIT NULL,
    [IsImplant] BIT NULL,
    [IsBridgeToMesial] BIT NULL,
    [IsBridgeToDistal] BIT NULL,
    [IsActive] BIT NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [IsMissingPontic] BIT NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'DentalStatusTooth'
    );


CREATE EXTERNAL TABLE [dbo].[TrayManufacturingSpecificationFailure] (
    [TrayManufacturingSpecificationGuid] UNIQUEIDENTIFIER NULL,
    [IsFixed] BIT NULL,
    [FixedByUserGuid] UNIQUEIDENTIFIER NULL,
    [FailedRoboticLogStoredFileGuid] UNIQUEIDENTIFIER NULL,
    [FixedOnUtc] DATETIME NULL,
    [LastDownloadedByUserGuid] UNIQUEIDENTIFIER NULL,
    [FriendlyModelId] NVARCHAR (15) NULL,
    [FailedRoboticLogText] NVARCHAR (MAX) NULL,
    [CreateUtc] DATETIME NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [ChangeUtc] DATETIME NULL,
    [ChangeUserGuid] UNIQUEIDENTIFIER NULL,
    [ChangeProgramName] NVARCHAR (100) NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'TrayManufacturingSpecificationFailure'
    );


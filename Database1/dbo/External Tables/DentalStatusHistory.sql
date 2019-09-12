CREATE EXTERNAL TABLE [dbo].[DentalStatusHistory] (
    [DentalStatusHistoryGuid] UNIQUEIDENTIFIER NULL,
    [PatientGuid] UNIQUEIDENTIFIER NULL,
    [IsOpposingTreatment] BIT NULL,
    [DentalStatusInstructionsJson] NVARCHAR (MAX) NULL,
    [DentalStatusJSONVersionText] NVARCHAR (50) NULL,
    [IsActive] BIT NULL,
    [ChangeUtc] DATETIME2 (7) NULL,
    [ChangeUserGuid] UNIQUEIDENTIFIER NULL,
    [ChangeProgramName] NVARCHAR (100) NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [NoStatusToReport] BIT NULL,
    [IsPvsImpressions] BIT NULL,
    [DentalStatusStoredFileGuid] UNIQUEIDENTIFIER NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'DentalStatusHistory'
    );


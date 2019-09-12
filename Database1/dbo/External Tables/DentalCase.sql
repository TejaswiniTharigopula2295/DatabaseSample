CREATE EXTERNAL TABLE [dbo].[DentalCase] (
    [DentalCaseGuid] UNIQUEIDENTIFIER NULL,
    [PatientGuid] UNIQUEIDENTIFIER NULL,
    [DentalCaseId] NVARCHAR (20) NULL,
    [FacilityGuid] UNIQUEIDENTIFIER NULL,
    [IsActive] BIT NULL,
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
    OBJECT_NAME = N'DentalCase'
    );


CREATE EXTERNAL TABLE [dbo].[Patient] (
    [PatientGuid] UNIQUEIDENTIFIER NULL,
    [GenderValue] INT NULL,
    [BirthYear] INT NULL,
    [IsActive] BIT NULL,
    [ChangeUtc] DATETIME2 (7) NULL,
    [ChangeUserGuid] UNIQUEIDENTIFIER NULL,
    [ChangeProgramName] NVARCHAR (100) NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [BillingAccountGuid] UNIQUEIDENTIFIER NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'vPatientForDW'
    );


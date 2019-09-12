CREATE TABLE [qa].[DentalCase] (
    [DentalCaseGuid]    VARCHAR (256)  NULL,
    [PatientGuid]       VARCHAR (256)  NULL,
    [DentalCaseId]      NVARCHAR (20)  NULL,
    [FacilityGuid]      VARCHAR (256)  NULL,
    [IsActive]          BIT            NULL,
    [ChangeUtc]         DATETIME2 (7)  NULL,
    [ChangeUserGuid]    VARCHAR (256)  NULL,
    [ChangeProgramName] NVARCHAR (100) NULL,
    [CreateUtc]         DATETIME2 (7)  NULL,
    [CreateUserGuid]    VARCHAR (256)  NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [ProcessedDateTime] DATETIME       NOT NULL
);


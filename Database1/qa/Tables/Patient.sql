CREATE TABLE [qa].[Patient] (
    [PatientGuid]        VARCHAR (256)  NULL,
    [GenderValue]        INT            NULL,
    [BirthYear]          INT            NULL,
    [IsActive]           BIT            NULL,
    [ChangeUtc]          DATETIME2 (7)  NULL,
    [ChangeUserGuid]     VARCHAR (256)  NULL,
    [ChangeProgramName]  NVARCHAR (100) NULL,
    [CreateUtc]          DATETIME2 (7)  NULL,
    [CreateUserGuid]     VARCHAR (256)  NULL,
    [CreateProgramName]  NVARCHAR (100) NULL,
    [BillingAccountGuid] VARCHAR (256)  NULL,
    [ProcessedDateTime]  DATETIME       NOT NULL
);


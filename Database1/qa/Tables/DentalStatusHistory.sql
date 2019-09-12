CREATE TABLE [qa].[DentalStatusHistory] (
    [DentalStatusHistoryGuid]      VARCHAR (256)  NULL,
    [PatientGuid]                  VARCHAR (256)  NULL,
    [IsOpposingTreatment]          BIT            NULL,
    [DentalStatusInstructionsJson] NVARCHAR (MAX) NULL,
    [DentalStatusJSONVersionText]  NVARCHAR (50)  NULL,
    [IsActive]                     BIT            NULL,
    [ChangeUtc]                    DATETIME2 (7)  NULL,
    [ChangeUserGuid]               VARCHAR (256)  NULL,
    [ChangeProgramName]            NVARCHAR (100) NULL,
    [CreateUtc]                    DATETIME2 (7)  NULL,
    [CreateUserGuid]               VARCHAR (256)  NULL,
    [CreateProgramName]            NVARCHAR (100) NULL,
    [NoStatusToReport]             BIT            NULL,
    [IsPvsImpressions]             BIT            NULL,
    [DentalStatusStoredFileGuid]   VARCHAR (256)  NULL,
    [ProcessedDateTime]            DATETIME       NOT NULL
);


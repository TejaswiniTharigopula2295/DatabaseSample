CREATE TABLE [qa].[DentalStatusTooth] (
    [DentalStatusToothGuid]   VARCHAR (256)  NULL,
    [DentalStatusHistoryGuid] VARCHAR (256)  NULL,
    [ToothValue]              INT            NULL,
    [IsSupernumerary]         BIT            NULL,
    [IsMissing]               BIT            NULL,
    [IsToBeExtracted]         BIT            NULL,
    [IsPrimary]               BIT            NULL,
    [IsFixed]                 BIT            NULL,
    [IsImplant]               BIT            NULL,
    [IsBridgeToMesial]        BIT            NULL,
    [IsBridgeToDistal]        BIT            NULL,
    [IsActive]                BIT            NULL,
    [CreateUtc]               DATETIME2 (7)  NULL,
    [CreateUserGuid]          VARCHAR (256)  NULL,
    [CreateProgramName]       NVARCHAR (100) NULL,
    [IsMissingPontic]         BIT            NULL,
    [ProcessedDateTime]       DATETIME       NOT NULL
);


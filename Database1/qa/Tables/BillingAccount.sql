CREATE TABLE [qa].[BillingAccount] (
    [BillingAccountGuid]   VARCHAR (256)  NULL,
    [BillingAccountName]   NVARCHAR (255) NULL,
    [BillingAccountNumber] NVARCHAR (20)  NULL,
    [AplusAccountNumber]   NVARCHAR (100) NULL,
    [IsActive]             BIT            NULL,
    [ChangeUtc]            DATETIME2 (7)  NULL,
    [ChangeUserGuid]       VARCHAR (256)  NULL,
    [ChangeProgramName]    NVARCHAR (100) NULL,
    [CreateUtc]            DATETIME2 (7)  NULL,
    [CreateUserGuid]       VARCHAR (256)  NULL,
    [CreateProgramName]    NVARCHAR (100) NULL,
    [ProcessedDateTime]    DATETIME       NOT NULL
);


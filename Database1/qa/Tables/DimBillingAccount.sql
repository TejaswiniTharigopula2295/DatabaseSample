CREATE TABLE [qa].[DimBillingAccount] (
    [BillingAccountKey]    INT            NOT NULL,
    [BillingAccountGUID]   NVARCHAR (50)  NOT NULL,
    [APlusAccountNumber]   NVARCHAR (50)  NOT NULL,
    [BillingAccountNumber] NVARCHAR (50)  NOT NULL,
    [BillingAccountName]   NVARCHAR (100) NOT NULL,
    [DoctorList]           NVARCHAR (100) NOT NULL,
    [DoctorCount]          NVARCHAR (50)  NOT NULL,
    [EffectiveDate]        DATETIME2 (7)  NOT NULL,
    [TerminationDate]      NVARCHAR (50)  NOT NULL,
    [IsActive]             BIT            NOT NULL
);


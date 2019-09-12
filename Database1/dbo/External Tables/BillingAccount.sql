CREATE EXTERNAL TABLE [dbo].[BillingAccount] (
    [BillingAccountGuid] UNIQUEIDENTIFIER NULL,
    [BillingAccountName] NVARCHAR (255) NULL,
    [BillingAccountNumber] NVARCHAR (20) NULL,
    [AplusAccountNumber] NVARCHAR (100) NULL,
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
    OBJECT_NAME = N'BillingAccount'
    );


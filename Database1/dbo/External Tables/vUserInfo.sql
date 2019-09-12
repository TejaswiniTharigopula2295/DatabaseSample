CREATE EXTERNAL TABLE [dbo].[vUserInfo] (
    [BillingAccountGuid] UNIQUEIDENTIFIER NULL,
    [Createutc] DATETIME2 (7) NULL,
    [FirstLoginDate] DATETIME2 (7) NULL,
    [LastFirstName] NVARCHAR (202) NULL,
    [LastLoginUtc] DATETIME2 (7) NULL,
    [MinDate] DATETIME2 (7) NULL,
    [UserGuid] UNIQUEIDENTIFIER NULL,
    [UserName] NVARCHAR (256) NULL,
    [WelcomeFirstSentDate] DATETIME2 (7) NULL,
    [WelcomeLastSentUtc] DATETIME2 (7) NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'vUserInfo'
    );


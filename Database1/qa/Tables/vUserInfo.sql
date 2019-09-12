CREATE TABLE [qa].[vUserInfo] (
    [BillingAccountGuid]   VARCHAR (256)  NULL,
    [Createutc]            DATETIME2 (7)  NULL,
    [FirstLoginDate]       DATETIME2 (7)  NULL,
    [LastFirstName]        NVARCHAR (202) NULL,
    [LastLoginUtc]         DATETIME2 (7)  NULL,
    [MinDate]              DATETIME2 (7)  NULL,
    [UserGuid]             VARCHAR (256)  NULL,
    [UserName]             NVARCHAR (256) NULL,
    [WelcomeFirstSentDate] DATETIME2 (7)  NULL,
    [WelcomeLastSentUtc]   DATETIME2 (7)  NULL,
    [ProcessedDateTime]    DATETIME       NOT NULL
);


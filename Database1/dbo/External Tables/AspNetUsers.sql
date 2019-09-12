CREATE EXTERNAL TABLE [dbo].[AspNetUsers] (
    [Id] UNIQUEIDENTIFIER NULL,
    [Email] NVARCHAR (256) NULL,
    [PhoneNumber] NVARCHAR (MAX) NULL,
    [PhoneNumberConfirmed] BIT NULL,
    [UserName] NVARCHAR (256) NULL,
    [IsActive] BIT NULL,
    [FirstName] NVARCHAR (100) NULL,
    [MiddleName] NVARCHAR (100) NULL,
    [LastName] NVARCHAR (100) NULL,
    [ChangeUtc] DATETIME2 (7) NULL,
    [ChangeUserGuid] UNIQUEIDENTIFIER NULL,
    [ChangeProgramName] NVARCHAR (100) NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [IsAdUser] BIT NULL,
    [LastLoginUtc] DATETIME2 (7) NULL,
    [BillingAccountGuid] UNIQUEIDENTIFIER NULL,
    [WelcomeLastSentUtc] DATETIME2 (7) NULL,
    [FirstLastName] NVARCHAR (201) NULL,
    [LastFirstName] NVARCHAR (202) NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'vAspNetUsersForDW'
    );


CREATE TABLE [qa].[OrthoSetup] (
    [OrthoSetupOrderItemGuid]   VARCHAR (256)  NULL,
    [ArchValue]                 INT            NULL,
    [OrthoSetupTypeValue]       INT            NULL,
    [DerivedFromOrthoSetupGuid] VARCHAR (256)  NULL,
    [SetupStagesQuantity]       INT            NULL,
    [IsActive]                  BIT            NULL,
    [ChangeUtc]                 DATETIME2 (7)  NULL,
    [ChangeUserGuid]            VARCHAR (256)  NULL,
    [ChangeProgramName]         NVARCHAR (100) NULL,
    [CreateUtc]                 DATETIME2 (7)  NULL,
    [CreateUserGuid]            VARCHAR (256)  NULL,
    [CreateProgramName]         NVARCHAR (100) NULL,
    [ProcessedDateTime]         DATETIME       NOT NULL
);


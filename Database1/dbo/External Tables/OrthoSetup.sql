CREATE EXTERNAL TABLE [dbo].[OrthoSetup] (
    [OrthoSetupOrderItemGuid] UNIQUEIDENTIFIER NULL,
    [ArchValue] INT NULL,
    [OrthoSetupTypeValue] INT NULL,
    [DerivedFromOrthoSetupGuid] UNIQUEIDENTIFIER NULL,
    [SetupStagesQuantity] INT NULL,
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
    OBJECT_NAME = N'OrthoSetup'
    );


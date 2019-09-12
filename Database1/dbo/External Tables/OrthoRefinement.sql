CREATE EXTERNAL TABLE [dbo].[OrthoRefinement] (
    [SalesOrderGuid] UNIQUEIDENTIFIER NULL,
    [DentalStatusHistoryGuid] UNIQUEIDENTIFIER NULL,
    [VersionNumber] INT NULL,
    [FinalSetupValue] INT NULL,
    [FinalSetupText] NVARCHAR (MAX) NULL,
    [ExistingAttachmentValue] INT NULL,
    [ExistingAttachmentCsv] NVARCHAR (200) NULL,
    [NewAttachmentValue] INT NULL,
    [NewAttachmentCsv] NVARCHAR (200) NULL,
    [NewAttachmentText] NVARCHAR (MAX) NULL,
    [IprValue] INT NULL,
    [IprCsv] NVARCHAR (200) NULL,
    [AdditionalIprValue] INT NULL,
    [AdditionalIprCsv] NVARCHAR (200) NULL,
    [SpacesValue] INT NULL,
    [SpacesCsv] NVARCHAR (200) NULL,
    [AdditionalInstructionText] NVARCHAR (MAX) NULL,
    [IsActive] BIT NULL,
    [ChangeUtc] DATETIME2 (7) NULL,
    [ChangeUserGuid] UNIQUEIDENTIFIER NULL,
    [ChangeProgramName] NVARCHAR (100) NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [IsOverCorrection] BIT NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'OrthoRefinement'
    );


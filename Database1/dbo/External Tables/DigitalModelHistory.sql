CREATE EXTERNAL TABLE [dbo].[DigitalModelHistory] (
    [DigitalModelHistoryGuid] UNIQUEIDENTIFIER NULL,
    [DigitalModelGuid] UNIQUEIDENTIFIER NULL,
    [DigitalModelHistoryTypeValue] INT NULL,
    [PropertyPathName] NVARCHAR (1000) NULL,
    [PropertyName] NVARCHAR (1000) NULL,
    [SubPropertyName] NVARCHAR (1000) NULL,
    [ValueAfterValue] INT NULL,
    [ValueAfterText] NVARCHAR (1000) NULL,
    [ValueAfterUtc] DATETIME NULL,
    [ValueAfterGuid] UNIQUEIDENTIFIER NULL,
    [OrderLogText] NVARCHAR (1000) NULL,
    [ModelJsonStoredFileGuid] UNIQUEIDENTIFIER NULL,
    [CommentText] NVARCHAR (MAX) NULL,
    [IsActive] BIT NULL,
    [CreateUtc] DATETIME NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [ModelJsonVersionText] NVARCHAR (50) NULL,
    [WorkingTimeInSeconds] INT NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'DigitalModelHistory'
    );


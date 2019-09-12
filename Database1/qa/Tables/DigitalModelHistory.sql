CREATE TABLE [qa].[DigitalModelHistory] (
    [DigitalModelHistoryGuid]      VARCHAR (256)   NULL,
    [DigitalModelGuid]             VARCHAR (256)   NULL,
    [DigitalModelHistoryTypeValue] INT             NULL,
    [PropertyPathName]             NVARCHAR (1000) NULL,
    [PropertyName]                 NVARCHAR (1000) NULL,
    [SubPropertyName]              NVARCHAR (1000) NULL,
    [ValueAfterValue]              INT             NULL,
    [ValueAfterText]               NVARCHAR (1000) NULL,
    [ValueAfterUtc]                DATETIME        NULL,
    [ValueAfterGuid]               VARCHAR (256)   NULL,
    [OrderLogText]                 NVARCHAR (1000) NULL,
    [ModelJsonStoredFileGuid]      VARCHAR (256)   NULL,
    [CommentText]                  NVARCHAR (MAX)  NULL,
    [IsActive]                     BIT             NULL,
    [CreateUtc]                    DATETIME        NULL,
    [CreateUserGuid]               VARCHAR (256)   NULL,
    [CreateProgramName]            NVARCHAR (100)  NULL,
    [ModelJsonVersionText]         NVARCHAR (50)   NULL,
    [WorkingTimeInSeconds]         INT             NULL,
    [ProcessedDateTime]            DATETIME        NOT NULL
);


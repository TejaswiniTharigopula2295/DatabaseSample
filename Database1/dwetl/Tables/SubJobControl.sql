CREATE TABLE [dwetl].[SubJobControl] (
    [JobControlID]    INT           NOT NULL,
    [SubJobControlID] INT           IDENTITY (1, 1) NOT NULL,
    [SubJobName]      VARCHAR (512) NOT NULL,
    [SubJobStartTime] DATETIME      DEFAULT (sysutcdatetime()) NOT NULL,
    [SubJobEndTime]   DATETIME      NULL,
    [SubJobStatus]    VARCHAR (128) NULL,
    PRIMARY KEY CLUSTERED ([SubJobControlID] ASC),
    FOREIGN KEY ([JobControlID]) REFERENCES [dwetl].[JobControl] ([JobControlID]) ON DELETE CASCADE
);


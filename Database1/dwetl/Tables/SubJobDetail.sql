CREATE TABLE [dwetl].[SubJobDetail] (
    [JobControlID]          INT           NOT NULL,
    [SubJobControlID]       INT           NOT NULL,
    [SubJobDetailID]        INT           IDENTITY (1, 1) NOT NULL,
    [SubJobDetailName]      VARCHAR (512) NOT NULL,
    [SubJobDetailStartTime] DATETIME      DEFAULT (sysutcdatetime()) NOT NULL,
    [SubJobDetailEndTime]   DATETIME      NULL,
    [SubJobDetailError]     VARCHAR (MAX) NULL,
    [SubJobDetailStatus]    VARCHAR (128) NULL,
    [LastProcessedDateTime] DATETIME2 (7) NULL,
    PRIMARY KEY CLUSTERED ([SubJobDetailID] ASC),
    FOREIGN KEY ([JobControlID]) REFERENCES [dwetl].[JobControl] ([JobControlID])
);


CREATE TABLE [dwetl].[JobControl] (
    [JobControlID] INT           IDENTITY (1, 1) NOT NULL,
    [JobName]      VARCHAR (512) NOT NULL,
    [JobStartTime] DATETIME      DEFAULT (sysutcdatetime()) NOT NULL,
    [JobEndTime]   DATETIME      NULL,
    [JobStatus]    VARCHAR (128) NULL,
    PRIMARY KEY CLUSTERED ([JobControlID] ASC)
);


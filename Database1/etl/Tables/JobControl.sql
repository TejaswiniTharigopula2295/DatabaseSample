CREATE TABLE [etl].[JobControl] (
    [JobControlID] INT            IDENTITY (1, 1) NOT NULL,
    [JobName]      VARCHAR (1000) NOT NULL,
    [SourceSystem] VARCHAR (1000) NOT NULL,
    [TargetSystem] VARCHAR (1000) NOT NULL,
    [JobStartTime] DATETIME       NOT NULL,
    [JobEndTime]   DATETIME       NULL,
    [JobStatus]    VARCHAR (100)  NOT NULL,
    PRIMARY KEY CLUSTERED ([JobControlID] ASC)
);


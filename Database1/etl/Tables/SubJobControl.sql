CREATE TABLE [etl].[SubJobControl] (
    [SubJobControlID]     INT            IDENTITY (1, 1) NOT NULL,
    [JobControlID]        INT            NOT NULL,
    [SubJobName]          VARCHAR (1000) NOT NULL,
    [SubJobStartTime]     DATETIME       DEFAULT (getdate()) NOT NULL,
    [LandingEndTime]      DATETIME       NULL,
    [LandingStatus]       VARCHAR (100)  NOT NULL,
    [LandingErrorMessage] VARCHAR (2000) NULL,
    [RefinedEndTime]      DATETIME       NULL,
    [RefinedStatus]       VARCHAR (100)  NULL,
    [RefinedErrorMessage] VARCHAR (2000) NULL,
    [SubJobStatus]        VARCHAR (100)  NULL,
    PRIMARY KEY CLUSTERED ([SubJobControlID] ASC),
    FOREIGN KEY ([JobControlID]) REFERENCES [etl].[JobControl] ([JobControlID])
);


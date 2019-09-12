CREATE TABLE [qa].[SubJobControl] (
    [SubJobControlID]        INT            IDENTITY (1, 1) NOT NULL,
    [JobControlID]           INT            NOT NULL,
    [SubJobName]             VARCHAR (1000) NOT NULL,
    [SubJobStartTime]        DATETIME       NOT NULL,
    [SubJobEndTime]          DATETIME       NULL,
    [DBO_Count]              VARCHAR (100)  NULL,
    [Refined_Count]          VARCHAR (100)  NULL,
    [DBOExceptRefined_Count] VARCHAR (100)  NULL,
    [RefinedExceptDBO_Count] VARCHAR (100)  NULL,
    [SubJobStatus]           VARCHAR (100)  NOT NULL,
    [DataValidationStatus]   VARCHAR (100)  NULL,
    [SubJobErrorMessage]     VARCHAR (2000) NULL,
    PRIMARY KEY CLUSTERED ([SubJobControlID] ASC),
    FOREIGN KEY ([JobControlID]) REFERENCES [qa].[JobControl] ([JobControlID])
);


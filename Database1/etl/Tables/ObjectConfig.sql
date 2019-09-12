CREATE TABLE [etl].[ObjectConfig] (
    [ObjectConfigID] INT            IDENTITY (1, 1) NOT NULL,
    [SourceSystem]   VARCHAR (1000) NULL,
    [SourceSchema]   VARCHAR (1000) NULL,
    [SourceObject]   VARCHAR (1000) NULL,
    [KeyColumns]     VARCHAR (1000) NULL,
    [LandingServer]  VARCHAR (1000) NULL,
    [LandingPath]    VARCHAR (1000) NULL,
    [LandingObject]  VARCHAR (1000) NULL,
    [RefinedServer]  VARCHAR (1000) NULL,
    [RefinedPath]    VARCHAR (1000) NULL,
    [RefinedObject]  VARCHAR (1000) NULL,
    [IsIncremental]  VARCHAR (2)    NULL,
    [IsActive]       BIT            DEFAULT ((1)) NOT NULL,
    [BucketNumber]   INT            NULL
);


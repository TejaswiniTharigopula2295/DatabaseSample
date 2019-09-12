CREATE TABLE [dwetl].[ObjectConfig] (
    [ObjectConfigID] INT            IDENTITY (1, 1) NOT NULL,
    [ObjectServer]   VARCHAR (1024) NOT NULL,
    [ObjectPath]     VARCHAR (1024) NOT NULL,
    [ObjectName]     VARCHAR (1024) NOT NULL,
    [ObjectLevel]    INT            NOT NULL,
    [ObjectSchema]   VARCHAR (10)   NULL,
    PRIMARY KEY CLUSTERED ([ObjectConfigID] ASC)
);


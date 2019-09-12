CREATE TABLE [qa].[TrayManufacturingSpecificationFailure] (
    [TrayManufacturingSpecificationGuid] VARCHAR (256)  NULL,
    [IsFixed]                            BIT            NULL,
    [FixedByUserGuid]                    VARCHAR (256)  NULL,
    [FailedRoboticLogStoredFileGuid]     VARCHAR (256)  NULL,
    [FixedOnUtc]                         DATETIME       NULL,
    [LastDownloadedByUserGuid]           VARCHAR (256)  NULL,
    [FriendlyModelId]                    NVARCHAR (15)  NULL,
    [FailedRoboticLogText]               NVARCHAR (MAX) NULL,
    [CreateUtc]                          DATETIME       NULL,
    [CreateUserGuid]                     VARCHAR (256)  NULL,
    [CreateProgramName]                  NVARCHAR (100) NULL,
    [ChangeUtc]                          DATETIME       NULL,
    [ChangeUserGuid]                     VARCHAR (256)  NULL,
    [ChangeProgramName]                  NVARCHAR (100) NULL,
    [ProcessedDateTime]                  DATETIME       NOT NULL
);


CREATE TABLE [qa].[Tray] (
    [TrayOrderItemGuid]                           VARCHAR (256)  NULL,
    [TrayManufacturingSpecificationOrderItemGuid] VARCHAR (256)  NULL,
    [ChangeUtc]                                   DATETIME2 (7)  NULL,
    [ChangeUserGuid]                              VARCHAR (256)  NULL,
    [ChangeProgramName]                           NVARCHAR (100) NULL,
    [CreateUtc]                                   DATETIME2 (7)  NULL,
    [CreateUserGuid]                              VARCHAR (256)  NULL,
    [CreateProgramName]                           NVARCHAR (100) NULL,
    [ProcessedDateTime]                           DATETIME       NOT NULL
);


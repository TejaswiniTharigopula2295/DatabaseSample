CREATE EXTERNAL TABLE [dbo].[TrayManufacturingSpecification] (
    [TrayManufacturingSpecificationOrderItemGuid] UNIQUEIDENTIFIER NULL,
    [ArchValue] INT NULL,
    [TrayUseValue] INT NULL,
    [IterationNumber] INT NULL,
    [PrintableModelStoredFileGuid] UNIQUEIDENTIFIER NULL,
    [TrimPathStoredFileGuid] UNIQUEIDENTIFIER NULL,
    [RoboticTrimPathStoredFileGuid] UNIQUEIDENTIFIER NULL,
    [MfgIprJson] NVARCHAR (4000) NULL,
    [LaserMarkingJson] NVARCHAR (1000) NULL,
    [PrintableModelGlobalOriginText] NVARCHAR (100) NULL,
    [PrintableModelTransformText] NVARCHAR (500) NULL,
    [ChangeUtc] DATETIME NULL,
    [ChangeUserGuid] UNIQUEIDENTIFIER NULL,
    [ChangeProgramName] NVARCHAR (100) NULL,
    [CreateUtc] DATETIME NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [IsProcessed] BIT NULL,
    [CtaParametersJson] NVARCHAR (1000) NULL,
    [RoboticTrimPathLogStoredFileGuid] UNIQUEIDENTIFIER NULL,
    [IsOvercorrectionStage] BIT NULL,
    [HeatingBmpStoredFileGuid] UNIQUEIDENTIFIER NULL,
    [LaserDeskStoredFileGuid] UNIQUEIDENTIFIER NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'TrayManufacturingSpecification'
    );


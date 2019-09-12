CREATE EXTERNAL TABLE [dbo].[StoredFile] (
    [StoredFileGuid] UNIQUEIDENTIFIER NULL,
    [PatientGuid] UNIQUEIDENTIFIER NULL,
    [FileLocationUri] NVARCHAR (1000) NULL,
    [FriendlyFileName] NVARCHAR (1000) NULL,
    [FileSizeInBytes] BIGINT NULL,
    [FileTypeValue] INT NULL,
    [ScanTypeValue] INT NULL,
    [PatientRecordTypeValue] INT NULL,
    [ThumbnailFileLocationUri] NVARCHAR (1000) NULL,
    [IsActive] BIT NULL,
    [ChangeUtc] DATETIME2 (7) NULL,
    [ChangeUserGuid] UNIQUEIDENTIFIER NULL,
    [ChangeProgramName] NVARCHAR (100) NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [CompressionAlgorithmValue] INT NULL,
    [IsFileCompressed] BIT NULL,
    [ScanStageValue] INT NULL,
    [LccStoredFileId] UNIQUEIDENTIFIER NULL,
    [QuickScanFileGuid] UNIQUEIDENTIFIER NULL,
    [ScannerTypeValue] INT NULL,
    [FileGroupGuid] UNIQUEIDENTIFIER NULL,
    [FileSourceValue] INT NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'vStoredFileJsonOnly'
    );


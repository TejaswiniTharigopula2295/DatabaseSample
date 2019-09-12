create procedure spUpsertStoredFile @StoredFile StoredFiletype READONLY
as 
BEGIN
MERGE StoredFile as target_sqldb
USING @StoredFile as source_tblstg
ON (target_sqldb.StoredFileGuid=source_tblstg.StoredFileGuid)

when matched then

UPDATE SET
StoredFileGuid =source_tblstg.StoredFileGuid ,
PatientGuid=source_tblstg.PatientGuid,
FileLocationUri=source_tblstg.FileLocationUri, 
FriendlyFileName=source_tblstg.FriendlyFileName,
CheckSumHash=source_tblstg.CheckSumHash,
FileSizeInBytes=source_tblstg.FileSizeInBytes, 
FileTypeValue=source_tblstg.FileTypeValue, 
ScanTypeValue=source_tblstg.ScanTypeValue,
PatientRecordTypeValue=source_tblstg.PatientRecordTypeValue,
TinyThumbnail=source_tblstg.TinyThumbnail ,
ThumbnailFileLocationUri =source_tblstg.ThumbnailFileLocationUri ,
IsActive=source_tblstg.IsActive, 
ChangeUtc=source_tblstg.ChangeUtc ,
ChangeUserGuid =source_tblstg.ChangeUserGuid ,
ChangeProgramName=	source_tblstg.ChangeProgramName ,
CreateUtc =	source_tblstg.CreateUtc ,
CreateUserGuid=source_tblstg.CreateUserGuid, 
CreateProgramName=	source_tblstg.CreateProgramName ,
CompressionAlgorithmValue=source_tblstg.CompressionAlgorithmValue,
IsFileCompressed =	source_tblstg.IsFileCompressed ,
ScanStageValue =	source_tblstg.ScanStageValue ,
LccStoredFileId =	source_tblstg.LccStoredFileId ,
QuickScanFileGuid =source_tblstg.QuickScanFileGuid ,
ScannerTypeValue=	source_tblstg.ScannerTypeValue ,
FileGroupGuid =	source_tblstg.FileGroupGuid ,
FileSourceValue =	source_tblstg.FileSourceValue 

when not matched then

insert
(
    StoredFileGuid ,
	PatientGuid,
	FileLocationUri, 
	FriendlyFileName,
	CheckSumHash,
	FileSizeInBytes, 
	FileTypeValue, 
	ScanTypeValue,
	PatientRecordTypeValue,
	TinyThumbnail ,
	ThumbnailFileLocationUri ,
	IsActive, 
	ChangeUtc ,
	ChangeUserGuid ,
	ChangeProgramName ,
	CreateUtc ,
	CreateUserGuid, 
	CreateProgramName ,
	CompressionAlgorithmValue,
	IsFileCompressed ,
	ScanStageValue ,
	LccStoredFileId ,
	QuickScanFileGuid ,
	ScannerTypeValue ,
	FileGroupGuid ,
	FileSourceValue 
	)
	VALUES
	(
    source_tblstg.StoredFileGuid ,
	source_tblstg.PatientGuid,
	source_tblstg.FileLocationUri, 
	source_tblstg.FriendlyFileName,
	source_tblstg.CheckSumHash,
	source_tblstg.FileSizeInBytes, 
	source_tblstg.FileTypeValue, 
	source_tblstg.ScanTypeValue,
	source_tblstg.PatientRecordTypeValue,
	source_tblstg.TinyThumbnail ,
	source_tblstg.ThumbnailFileLocationUri ,
	source_tblstg.IsActive, 
	source_tblstg.ChangeUtc ,
	source_tblstg.ChangeUserGuid ,
	source_tblstg.ChangeProgramName ,
	source_tblstg.CreateUtc ,
	source_tblstg.CreateUserGuid, 
	source_tblstg.CreateProgramName ,
	source_tblstg.CompressionAlgorithmValue,
	source_tblstg.IsFileCompressed ,
	source_tblstg.ScanStageValue ,
	source_tblstg.LccStoredFileId ,
	source_tblstg.QuickScanFileGuid ,
	source_tblstg.ScannerTypeValue ,
	source_tblstg.FileGroupGuid ,
	source_tblstg.FileSourceValue 
	);
	end
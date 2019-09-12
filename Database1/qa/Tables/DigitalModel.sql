﻿CREATE TABLE [qa].[DigitalModel] (
    [DigitalModelGuid]        VARCHAR (256)  NULL,
    [DentalCaseGuid]          VARCHAR (256)  NULL,
    [UpperOrderItemGuid]      VARCHAR (256)  NULL,
    [LowerOrderItemGuid]      VARCHAR (256)  NULL,
    [IterationNumber]         INT            NULL,
    [ModelTypeValue]          INT            NULL,
    [ModelStateValue]         INT            NULL,
    [ModelJsonLastUpdateUtc]  DATETIME2 (7)  NULL,
    [ScannerTypeValue]        INT            NULL,
    [CheckedOutUserGuid]      VARCHAR (256)  NULL,
    [CheckedOutUtc]           DATETIME2 (7)  NULL,
    [ModelJSONVersionText]    NVARCHAR (50)  NULL,
    [ModelJsonStoredFileGuid] VARCHAR (256)  NULL,
    [IsActive]                BIT            NULL,
    [ChangeUtc]               DATETIME2 (7)  NULL,
    [ChangeUserGuid]          VARCHAR (256)  NULL,
    [ChangeProgramName]       NVARCHAR (100) NULL,
    [CreateUtc]               DATETIME2 (7)  NULL,
    [CreateUserGuid]          VARCHAR (256)  NULL,
    [CreateProgramName]       NVARCHAR (100) NULL,
    [IsNewSetupCreatedFrom]   BIT            NULL,
    [ModelStateUtc]           DATETIME2 (7)  NULL,
    [ModelUploadUtc]          DATETIME2 (7)  NULL,
    [PatientGuid]             VARCHAR (256)  NULL,
    [SalesOrderGuid]          VARCHAR (256)  NULL,
    [OrthoPrescriptionGuid]   VARCHAR (256)  NULL,
    [MaxMovementMm]           FLOAT (53)     NULL,
    [MaxRotationDeg]          FLOAT (53)     NULL,
    [MaxAngulationDeg]        FLOAT (53)     NULL,
    [MaxTorqueDeg]            FLOAT (53)     NULL,
    [IsModelOnHold]           BIT            NULL,
    [AssignedToUserGuid]      VARCHAR (256)  NULL,
    [ProcessedDateTime]       DATETIME       NOT NULL
);


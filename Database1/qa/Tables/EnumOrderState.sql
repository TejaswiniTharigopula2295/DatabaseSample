CREATE TABLE [qa].[EnumOrderState] (
    [OrderStateValue]                   INT            NULL,
    [OrderStateName]                    NVARCHAR (20)  NULL,
    [OrderStateDescription]             NVARCHAR (200) NULL,
    [SortOrder]                         SMALLINT       NULL,
    [IsActive]                          BIT            NULL,
    [IsDefault]                         BIT            NULL,
    [LocalizationGuid]                  VARCHAR (256)  NULL,
    [IsExternalActionRequired]          BIT            NULL,
    [IsInternalActionRequired]          BIT            NULL,
    [VisualIndicatorCode]               NVARCHAR (10)  NULL,
    [IsQcPrescriptionActionRequired]    BIT            NULL,
    [QcPrescriptionVisualIndicatorCode] NVARCHAR (10)  NULL,
    [InternalVisualIndicatorIconValue]  INT            NULL,
    [ExternalVisualIndicatorIconValue]  INT            NULL,
    [QcVisualIndicatorIconValue]        INT            NULL,
    [ProcessedDateTime]                 DATETIME       NOT NULL
);


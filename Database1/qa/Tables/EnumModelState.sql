CREATE TABLE [qa].[EnumModelState] (
    [ModelStateValue]       INT            NULL,
    [ModelStateName]        NVARCHAR (20)  NULL,
    [ModelStateDescription] NVARCHAR (100) NULL,
    [SortOrder]             SMALLINT       NULL,
    [IsActive]              BIT            NULL,
    [IsDefault]             BIT            NULL,
    [LocalizationGuid]      VARCHAR (256)  NULL,
    [IsViewable]            BIT            NULL,
    [ProcessedDateTime]     DATETIME       NOT NULL
);


CREATE TABLE [qa].[EnumModelType] (
    [ModelTypeValue]       INT            NULL,
    [ModelTypeName]        NVARCHAR (20)  NULL,
    [ModelTypeDescription] NVARCHAR (100) NULL,
    [SortOrder]            SMALLINT       NULL,
    [IsActive]             BIT            NULL,
    [IsDefault]            BIT            NULL,
    [LocalizationGuid]     VARCHAR (256)  NULL,
    [ProcessedDateTime]    DATETIME       NOT NULL
);


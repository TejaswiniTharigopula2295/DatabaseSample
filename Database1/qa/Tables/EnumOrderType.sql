CREATE TABLE [qa].[EnumOrderType] (
    [OrderTypeValue]       INT            NULL,
    [OrderTypeName]        NVARCHAR (20)  NULL,
    [OrderTypeDescription] NVARCHAR (100) NULL,
    [SortOrder]            SMALLINT       NULL,
    [IsActive]             BIT            NULL,
    [IsDefault]            BIT            NULL,
    [LocalizationGuid]     VARCHAR (256)  NULL,
    [ProcessedDateTime]    DATETIME       NOT NULL
);


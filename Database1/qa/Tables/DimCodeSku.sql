CREATE TABLE [qa].[DimCodeSku] (
    [CodeSkuKey]             INT            NOT NULL,
    [Sku]                    NVARCHAR (50)  NOT NULL,
    [RefNumber]              NVARCHAR (50)  NOT NULL,
    [ProductSkuCategory]     NVARCHAR (50)  NOT NULL,
    [SkuDescription]         NVARCHAR (100) NOT NULL,
    [ReportDescription]      NVARCHAR (100) NOT NULL,
    [SkuType]                NVARCHAR (50)  NULL,
    [TrayUseValue]           NVARCHAR (50)  NULL,
    [IsFromRefinement]       NVARCHAR (50)  NULL,
    [OrderTypeValue]         NVARCHAR (50)  NULL,
    [OrderStateValue]        INT            NULL,
    [ReorderReasonValue]     NVARCHAR (50)  NULL,
    [DiscountQty]            NVARCHAR (50)  NULL,
    [CanChargeForCancel]     NVARCHAR (50)  NULL,
    [ProductSourceTypeValue] NVARCHAR (50)  NULL
);


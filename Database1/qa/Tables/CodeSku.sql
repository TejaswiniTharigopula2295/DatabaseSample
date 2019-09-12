CREATE TABLE [qa].[CodeSku] (
    [Sku]                    NVARCHAR (20)  NOT NULL,
    [RefNumber]              NVARCHAR (10)  NOT NULL,
    [SkuDescription]         NVARCHAR (100) NOT NULL,
    [ReportDescription]      NVARCHAR (100) NOT NULL,
    [SkuType]                INT            NULL,
    [TrayUseValue]           INT            NULL,
    [IsFromRefinement]       INT            NULL,
    [OrderTypeValue]         NVARCHAR (100) NULL,
    [OrderStateValue]        NVARCHAR (100) NULL,
    [ReorderReasonValue]     INT            NULL,
    [DiscountQty]            INT            NULL,
    [DiscountCode]           NVARCHAR (50)  NULL,
    [CanChargeForCancel]     INT            NULL,
    [ProductSourceTypeValue] INT            NULL,
    [ProcessedDateTime]      DATETIME       NOT NULL
);


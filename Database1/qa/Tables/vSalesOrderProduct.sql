CREATE TABLE [qa].[vSalesOrderProduct] (
    [SalesOrderGUID]    VARCHAR (256) NULL,
    [SalesOrderId]      NVARCHAR (30) NULL,
    [Sku]               NVARCHAR (20) NOT NULL,
    [RefNumber]         NVARCHAR (10) NOT NULL,
    [ProductQty]        INT           NULL,
    [ProcessedDateTime] DATETIME      NOT NULL
);


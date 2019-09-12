CREATE TABLE [qa].[DimSalesOrder] (
    [SalesOrderKey]        INT           NOT NULL,
    [SalesOrderGUID]       NVARCHAR (50) NOT NULL,
    [RootSalesOrderGUID]   NVARCHAR (50) NOT NULL,
    [ParentSalesOrderGUID] NVARCHAR (50) NOT NULL,
    [SalesOrderID]         NVARCHAR (50) NOT NULL
);


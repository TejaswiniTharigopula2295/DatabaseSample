CREATE TABLE [qa].[FactSalesOrderProduct] (
    [SalesRepKey]           INT           NOT NULL,
    [BillingAccountKey]     INT           NOT NULL,
    [DoctorKey]             INT           NOT NULL,
    [DentalCaseKey]         INT           NOT NULL,
    [PatientKey]            INT           NOT NULL,
    [SalesOrderKey]         INT           NOT NULL,
    [DentalCaseGuid]        NVARCHAR (50) NOT NULL,
    [SalesOrderGuid]        NVARCHAR (50) NOT NULL,
    [RootSalesOrderGuid]    NVARCHAR (50) NOT NULL,
    [ParentSalesOrderGuid]  NVARCHAR (1)  NULL,
    [SalesOrderId]          NVARCHAR (50) NOT NULL,
    [OrderTypeStateKey]     INT           NOT NULL,
    [IsActive]              BIT           NOT NULL,
    [IsExpedited]           BIT           NOT NULL,
    [OrderStateUtc]         DATETIME2 (7) NOT NULL,
    [OrderStateDateKey]     INT           NOT NULL,
    [FirstSubmittedDate]    DATETIME2 (7) NOT NULL,
    [FirstSubmittedDateKey] INT           NOT NULL,
    [CodeSkuKey]            INT           NOT NULL,
    [ProductQty]            INT           NOT NULL
);


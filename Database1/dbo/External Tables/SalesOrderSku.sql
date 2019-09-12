CREATE EXTERNAL TABLE [dbo].[SalesOrderSku] (
    [SalesOrderSkuGuid] UNIQUEIDENTIFIER NULL,
    [BillingAccountName] NVARCHAR (100) NULL,
    [CompanyNumber] NVARCHAR (2) NULL,
    [AplusCustomerNumber] NVARCHAR (20) NULL,
    [DentalCaseId] NVARCHAR (20) NULL,
    [SalesOrderId] NVARCHAR (20) NULL,
    [CaseQty] INT NULL,
    [SkuDescription] NVARCHAR (100) NULL,
    [Sku] NVARCHAR (20) NULL,
    [SkuQty] INT NULL,
    [RefNumber] NVARCHAR (20) NULL,
    [ReplacementReasonCode] NVARCHAR (100) NULL,
    [OrderTypeDescription] NVARCHAR (100) NULL,
    [OrderStateDescription] NVARCHAR (100) NULL,
    [ManufacturingWorkOrderId] NVARCHAR (100) NULL,
    [IsClinical] BIT NULL,
    [ChangeUtc] DATETIME2 (7) NULL,
    [ChangeProgramName] NVARCHAR (100) NULL,
    [ChangeUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'SalesOrderSku'
    );


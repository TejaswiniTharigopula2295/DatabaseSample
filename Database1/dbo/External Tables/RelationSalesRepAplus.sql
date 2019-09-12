CREATE EXTERNAL TABLE [dbo].[RelationSalesRepAplus] (
    [ArCustomerNumber] VARCHAR (50) NULL,
    [AplusAccountNumber] VARCHAR (50) NULL,
    [Territory] VARCHAR (50) NULL,
    [SalesRepName] VARCHAR (100) NULL,
    [CustName] VARCHAR (100) NULL,
    [CustAddr1] VARCHAR (100) NULL,
    [CustAddr2] VARCHAR (100) NULL,
    [CustAddr3] VARCHAR (100) NULL,
    [CustAddr4] VARCHAR (100) NULL,
    [CustCity] VARCHAR (100) NULL,
    [CustStateProv] VARCHAR (50) NULL,
    [CustZip] VARCHAR (100) NULL,
    [SalesPhoneNumber] VARCHAR (50) NULL,
    [OcpAccountName] VARCHAR (100) NULL,
    [CleanedUpCustName] VARCHAR (100) NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [ChangeUtc] DATETIME2 (7) NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'RelationSalesRepAplus'
    );


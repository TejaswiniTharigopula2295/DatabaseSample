CREATE TABLE [qa].[DimSalesRep] (
    [SalesRepKey]   INT           NOT NULL,
    [SalesRepId]    NVARCHAR (1)  NULL,
    [FirstName]     NVARCHAR (1)  NULL,
    [LastName]      NVARCHAR (1)  NULL,
    [FirstLastName] NVARCHAR (50) NOT NULL,
    [LastFirstName] NVARCHAR (50) NOT NULL,
    [Territory]     NVARCHAR (1)  NULL,
    [IsActive]      BIT           NOT NULL
);


CREATE TABLE [qa].[FactSalesOrderHistory] (
    [SnapshotDateKey]              VARCHAR (50) NOT NULL,
    [SalesRepKey]                  VARCHAR (50) NOT NULL,
    [BillingAccountKey]            VARCHAR (50) NOT NULL,
    [BillingAccountGUID]           VARCHAR (50) NOT NULL,
    [DoctorKey]                    VARCHAR (50) NOT NULL,
    [DoctorGUID]                   VARCHAR (50) NOT NULL,
    [DentalCaseKey]                VARCHAR (50) NOT NULL,
    [DentalCaseGUID]               VARCHAR (50) NOT NULL,
    [PatientKey]                   VARCHAR (50) NOT NULL,
    [PatientGUID]                  VARCHAR (50) NOT NULL,
    [SalesOrderKey]                VARCHAR (50) NOT NULL,
    [SalesOrderGUID]               VARCHAR (50) NOT NULL,
    [IsDentalCaseSubmitted]        VARCHAR (50) NOT NULL,
    [IsOrderSubmitted]             VARCHAR (50) NOT NULL,
    [IsOrderShipped]               VARCHAR (50) NOT NULL,
    [SubmittedSetupCycleTime_Days] VARCHAR (50) NULL
);


CREATE TABLE [qa].[DimPatient] (
    [patientKey]         INT           NOT NULL,
    [PatientGUID]        NVARCHAR (50) NOT NULL,
    [PatientID]          NVARCHAR (50) NOT NULL,
    [BirthYear]          NVARCHAR (50) NOT NULL,
    [Gender]             NVARCHAR (50) NOT NULL,
    [BillingAccountGUID] NVARCHAR (50) NOT NULL,
    [IsActive]           BIT           NOT NULL
);


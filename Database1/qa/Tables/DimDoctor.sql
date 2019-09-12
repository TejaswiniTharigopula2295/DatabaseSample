CREATE TABLE [qa].[DimDoctor] (
    [DoctorKey]           INT           NOT NULL,
    [DoctorGUID]          NVARCHAR (50) NOT NULL,
    [Email]               NVARCHAR (50) NOT NULL,
    [EmailName]           NVARCHAR (50) NOT NULL,
    [EmailConfirmed]      NVARCHAR (50) NULL,
    [DoctorFirstName]     NVARCHAR (50) NOT NULL,
    [DoctorMiddleName]    NVARCHAR (50) NULL,
    [DoctorLastName]      NVARCHAR (50) NOT NULL,
    [Salutation]          NVARCHAR (1)  NULL,
    [DrNpi]               NVARCHAR (1)  NULL,
    [DoctorFirstLastName] NVARCHAR (50) NOT NULL,
    [DoctorLastFirstName] NVARCHAR (50) NOT NULL,
    [EffectiveDate]       NVARCHAR (50) NOT NULL,
    [TerminationDate]     NVARCHAR (50) NULL,
    [IsActive]            BIT           NOT NULL
);


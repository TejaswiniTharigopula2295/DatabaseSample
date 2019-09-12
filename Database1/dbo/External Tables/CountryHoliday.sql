CREATE EXTERNAL TABLE [dbo].[CountryHoliday] (
    [HolidayDate] DATE NOT NULL,
    [CountryValue] INT NOT NULL,
    [HolidayDescription] NVARCHAR (100) NULL,
    [CreateUtc] DATETIME2 (7) NOT NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NOT NULL,
    [CreateProgramName] NVARCHAR (100) NOT NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'CountryHoliday'
    );


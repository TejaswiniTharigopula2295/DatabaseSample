CREATE EXTERNAL DATA SOURCE [RemoteDbProd]
    WITH (
    TYPE = RDBMS,
    LOCATION = N'orlcarecloud.database.windows.net',
    DATABASE_NAME = N'OralCareCloud',
    CREDENTIAL = [ProdDbCredential]
    );


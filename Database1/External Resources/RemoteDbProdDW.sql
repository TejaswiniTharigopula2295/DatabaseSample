CREATE EXTERNAL DATA SOURCE [RemoteDbProdDW]
    WITH (
    TYPE = RDBMS,
    LOCATION = N'orlcarecloud.database.windows.net',
    DATABASE_NAME = N'OcpDataWarehouse',
    CREDENTIAL = [ProdDbCredential]
    );


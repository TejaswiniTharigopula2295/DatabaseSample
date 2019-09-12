CREATE EXTERNAL DATA SOURCE [RemoteDb_dw]
    WITH (
    TYPE = RDBMS,
    LOCATION = N'occpreproduction.database.windows.net',
    DATABASE_NAME = N'OcpDataWarehouse',
    CREDENTIAL = [CrossDbCredential]
    );


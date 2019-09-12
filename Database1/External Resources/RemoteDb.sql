CREATE EXTERNAL DATA SOURCE [RemoteDb]
    WITH (
    TYPE = RDBMS,
    LOCATION = N'occpreproduction.database.windows.net',
    DATABASE_NAME = N'OralCareCloudSL2Staging',
    CREDENTIAL = [CrossDbCredential]
    );


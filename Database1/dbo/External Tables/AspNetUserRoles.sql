CREATE EXTERNAL TABLE [dbo].[AspNetUserRoles] (
    [UserId] UNIQUEIDENTIFIER NULL,
    [RoleId] UNIQUEIDENTIFIER NULL,
    [CreateUTC] DATETIME2 (7) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'AspNetUserRoles'
    );


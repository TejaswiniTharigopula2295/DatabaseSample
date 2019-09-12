CREATE TABLE [qa].[ASPNetUserRoles] (
    [UserId]            VARCHAR (256)  NULL,
    [RoleId]            VARCHAR (256)  NULL,
    [CreateUTC]         DATETIME2 (7)  NULL,
    [CreateUserGuid]    VARCHAR (256)  NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [ProcessedDateTime] DATETIME       NOT NULL
);


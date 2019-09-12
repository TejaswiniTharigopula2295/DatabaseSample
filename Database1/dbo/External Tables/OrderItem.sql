CREATE EXTERNAL TABLE [dbo].[OrderItem] (
    [OrderItemGuid] UNIQUEIDENTIFIER NULL,
    [SalesOrderGuid] UNIQUEIDENTIFIER NULL,
    [OrderItemNumber] INT NULL,
    [OrderItemTypeValue] INT NULL,
    [IsActive] BIT NULL,
    [ChangeUtc] DATETIME2 (7) NULL,
    [ChangeUserGuid] UNIQUEIDENTIFIER NULL,
    [ChangeProgramName] NVARCHAR (100) NULL,
    [CreateUtc] DATETIME2 (7) NULL,
    [CreateUserGuid] UNIQUEIDENTIFIER NULL,
    [CreateProgramName] NVARCHAR (100) NULL,
    [ApplianceGuid] UNIQUEIDENTIFIER NULL,
    [BlockSize] INT NULL,
    [BrandOriginalName] NVARCHAR (100) NULL,
    [DentalAlloy] INT NULL,
    [MaterialColorName] NVARCHAR (100) NULL,
    [ModelGuid] UNIQUEIDENTIFIER NULL,
    [OriginalRestorationText] NVARCHAR (2000) NULL,
    [PrescriptionNoteText] NVARCHAR (2000) NULL,
    [ProductGuid] UNIQUEIDENTIFIER NULL,
    [RestorationGuid] UNIQUEIDENTIFIER NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'OrderItem'
    );


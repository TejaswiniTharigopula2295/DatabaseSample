CREATE TABLE [qa].[DimModelType] (
    [ModelTypeKey]         INT           NOT NULL,
    [ModelTypeID]          INT           NOT NULL,
    [ModelTypeName]        NVARCHAR (50) NOT NULL,
    [ModelTypeDescription] NVARCHAR (50) NOT NULL,
    [ModelTypeSort]        NVARCHAR (50) NOT NULL,
    [IsActive]             BIT           NOT NULL
);


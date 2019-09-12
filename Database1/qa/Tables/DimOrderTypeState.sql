CREATE TABLE [qa].[DimOrderTypeState] (
    [OrderTypeStateKey]     INT           NOT NULL,
    [OrderTypeID]           INT           NOT NULL,
    [OrderTypeName]         NVARCHAR (50) NOT NULL,
    [OrderTypeDescription]  NVARCHAR (50) NOT NULL,
    [OrderTypeSort]         INT           NULL,
    [OrderStateID]          INT           NULL,
    [OrderStateName]        NVARCHAR (50) NOT NULL,
    [OrderStateDescription] NVARCHAR (50) NOT NULL,
    [OrderStateSort]        INT           NULL,
    [IsActiveOrderState]    BIT           NOT NULL,
    [ReportColumnName]      NVARCHAR (50) NULL,
    [ReportSortOrder]       INT           NULL,
    [IsReported]            BIT           NOT NULL
);


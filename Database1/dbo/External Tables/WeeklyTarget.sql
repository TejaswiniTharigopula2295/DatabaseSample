CREATE EXTERNAL TABLE [dbo].[WeeklyTarget] (
    [IsoYear] INT NULL,
    [IsoWeek] INT NULL,
    [WeekDate] DATE NULL,
    [TargetDoctorAddedQuantity] INT NULL,
    [TargetDoctorActiveQuantity] INT NULL,
    [TargetSubmittedOrderQuantity] INT NULL,
    [TargetShippedOrderQuantity] INT NULL,
    [TargetOrderStageQuantity] INT NULL,
    [TargetAverageOrderCost] INT NULL,
    [TargetRevenue] INT NULL,
    [ChangeUtc] DATETIME2 (7) NULL
)
    WITH (
    DATA_SOURCE = [RemoteDbProd],
    SCHEMA_NAME = N'dbo',
    OBJECT_NAME = N'WeeklyTarget'
    );


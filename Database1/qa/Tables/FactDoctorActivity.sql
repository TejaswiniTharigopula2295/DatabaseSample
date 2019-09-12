CREATE TABLE [qa].[FactDoctorActivity] (
    [ActivityDateKey]    INT           NOT NULL,
    [SalesRepKey]        INT           NOT NULL,
    [BillingAccountKey]  INT           NOT NULL,
    [BillingAccountGUID] NVARCHAR (50) NOT NULL,
    [DoctorKey]          INT           NOT NULL,
    [DoctorGUID]         NVARCHAR (50) NOT NULL,
    [IsFirstLoggedIn]    INT           NOT NULL,
    [IsLoggedIn]         INT           NOT NULL,
    [IsFirstInviteSent]  INT           NOT NULL,
    [IsInviteSent]       INT           NOT NULL
);



CREATE PROCEDURE [dbo].[uspGetSalesOrderAplusSkuRef] (
  @IsEF BIT = 0
  ,@UserGuid UNIQUEIDENTIFIER = NULL
  ,@SalesOrderGuid UNIQUEIDENTIFIER = NULL
  )
  /**************************************************************************************************
PROCEDURE NAME: [uspGetSalesOrderAplusSkuRef]
DESCRIPTION: 
OWNER: 
PARAMETERS :
  @IsEF BIT = 0
  ,@UserGuid UNIQUEIDENTIFIER NULL
  ,@SalesOrderGuid UNIQUEIDENTIFIER = NULL

MAINTENANCE LOG:
DATE     NAME   BUILD#  DESCRIPTION OF CHANGE OR TFS TASK #
---------------------------------------------------------------------------------------------------
20170815 DSERIE 1.0     New
20180502 DSERIE 4.0     Need to ignore cancellations  Bug 102459
20180609 DSERIE 5.0     Bug 108942.  Create Temp CodeSku and replace the IsForRefinement to NULL for 
						Skus 70-0009-0944-3 and 70-0009-0991-4.
20181010 DSERIE 6.0     Case Qty was returning multiple recs throwing an error added IsActive=1 filter
20181019 DSERIE 6.0     Changed for new Skus; be aware using table DBcontext thinks is from refinement is an INT
**************************************************************************************************/
/**************************************************************************************************
DECLARE @IsEF BIT = 0
DECLARE @UserGuid  UNIQUEIDENTIFIER ='CDB3C62C-57A8-4A87-9E3D-6F15847849A9' --Doug.Doctor
DECLARE @SalesOrderGuid UNIQUEIDENTIFIER = (SELECT SalesOrderGuid FROM SalesOrder WHERE SalesOrderId='D9LQ202')
EXEC dbo.uspGetSalesOrderAplusSkuRef 
  @IsEF = @IsEF
  ,@UserGuid = @UserGuid
  ,@SalesOrderGuid = @SalesOrderGuid
**************************************************************************************************/
AS
BEGIN
  --Turn off the count so that the stored procedure does not affect our result set
  SET NOCOUNT ON;    

  /*Insert a Log row for this SP execution*/
  DECLARE 
  @MyProcedureName   NVARCHAR(100) = 'uspGetSalesOrderAplusSkuRef'

  DECLARE
  @ExecutionUtc      DATETIME2            = GETUTCDATE()
  ,@ExecutionTime    DATETIME2
  ,@ResultText             NVARCHAR(1000)       = ''
  ,@ExecutionText    NVARCHAR(1000)       = 'EXEC ' + @MyProcedureName + 
    ' @IsEF='  + CASE WHEN @IsEF IS NULL THEN '0' ELSE CONVERT(NVARCHAR(1),@IsEF) END +
    ',@UserGuid='  + CASE WHEN @UserGuid IS NULL THEN 'NULL' ELSE CHAR(39) + CONVERT(NVARCHAR(40),@UserGuid) + CHAR(39) END +
    ',@SalesOrderGuid='  + CASE WHEN @SalesOrderGuid IS NULL THEN 'NULL' ELSE CHAR(39) + CONVERT(NVARCHAR(40),@SalesOrderGuid) + CHAR(39) END
  ,@ReturnText NVARCHAR(1000)            = ''
  ,@ProcedureLogGuid UNIQUEIDENTIFIER = NEWID()

--CREATE TABLE #t_uspGetSalesOrderAplusSkuRef (
--  CompanyNumber NVARCHAR(10)
--  ,AplusAccountNumber NVARCHAR(20)
--  ,DentalCaseId NVARCHAR(10)
--  ,SalesOrderId NVARCHAR(10)
--  ,OrderTypeValue INT
--  ,OrderStateValue INT
--  ,IsFromRefinement BIT
--  ,CaseQty INT
--  ,TrayUseValue INT
--  ,IterationNumber INT
--  ,SkuType INT
--  ,ManufacturingWorkOrderId NVARCHAR(20)
--  ,ReorderReasonValue INT
--  ,Sku NVARCHAR(20)
--  ,RefNumber NVARCHAR(10)
--  ,SkuDescription NVARCHAR(200)
--  ,ReportDescription NVARCHAR(200)
--  )

--INSERT INTO #t_uspGetSalesOrderAplusSkuRef
SELECT
  q2.CompanyNumber
  ,q2.AplusAccountNumber
  ,q2.DentalCaseId
  ,q2.SalesOrderId
  ,q2.OrderTypeValue
  ,q2.OrderStateValue
  ,q2.IsFromRefinement
  ,q2.CaseQty
  ,q2.TrayUseValue
  ,q2.IterationNumber
  ,q2.SkuType
  ,q2.ManufacturingWorkOrderId
  ,q2.ReorderReasonValue
  ,v.Sku
  ,v.RefNumber
  ,v.SkuDescription
  ,REPLACE(v.ReportDescription,'<SKUType>',CASE WHEN q2.SkuType = 1 THEN 'SINGLE' WHEN q2.SkuType = 1 THEN 'Dual' ELSE '' END) AS ReportDescription
--  ,ISNULL(v.ReorderReasonValue,q2.ReorderReasonValue) , q2.ReorderReasonValue
FROM (
SELECT
  q.CompanyNumber
  ,q.AplusAccountNumber
  ,q.DentalCaseId
  ,q.SalesOrderId
  ,q.OrderTypeValue
  ,q.OrderStateValue
  ,q.IsFromRefinement
  ,q.CaseQty
  ,q.TrayUseValue
  ,q.IterationNumber
  ,q.SkuType
  ,q.ManufacturingWorkOrderId
  ,q.ReorderReasonValue
  ,q.ProductSourceTypeValue
FROM (
  SELECT
    '01' AS CompanyNumber
    ,ba.AplusAccountNumber
    ,dc.DentalCaseId
    ,so.SalesOrderId
    ,so.OrderTypeValue
    ,so.OrderStateValue
    ,CASE WHEN soRefine.OrderTypeValue = 7 THEN 1 ELSE 0 END AS IsFromRefinement
    ,ISNULL((SELECT dbo.ufnMaxIterationNumber(SalesOrderGuid) FROM SalesOrder WHERE RootSalesOrderGuid = so.RootSalesOrderGuid AND OrderTypeValue = 2 AND IsActive = 1)
           ,(SELECT dbo.ufnMaxIterationNumber(SalesOrderGuid) FROM SalesOrder WHERE RootSalesOrderGuid = so.RootSalesOrderGuid AND OrderTypeValue = 8 AND IsActive = 1)) AS CaseQty
    ,tms.TrayUseValue
    ,tms.IterationNumber
    ,COUNT(DISTINCT tms.ArchValue) AS SkuType
    ,so.ManufacturingWorkOrderId
    ,so.ReorderReasonValue
	,ISNULL(p.ProductSourceTypeValue,10) AS ProductSourceTypeValue
  FROM
    DentalCase dc
    INNER JOIN SalesOrder so ON
      dc.DentalCaseGuid = so.DentalCaseGuid
    INNER JOIN BillingAccount ba ON
      ba.BillingAccountGuid = so.BillingAccountGuid
	LEFT OUTER JOIN SalesOrderProduct sop ON
	  sop.SalesOrderGuid = so.SalesOrderGuid
	LEFT OUTER JOIN CodeProduct p ON
	  p.ProductCodeValue = sop.ProductCodeValue
    LEFT OUTER JOIN SalesOrder soRefine ON
      soRefine.SalesOrderGuid = so.ParentSalesOrderGuid
    LEFT OUTER JOIN OrderItem oi ON
      oi.SalesOrderGuid = so.SalesOrderGuid
    LEFT OUTER JOIN Tray t ON
      t.TrayOrderItemGuid = oi.OrderItemGuid
    LEFT OUTER JOIN TrayManufacturingSpecification tms ON
      tms.TrayManufacturingSpecificationOrderItemGuid = t.TrayManufacturingSpecificationOrderItemGuid
  WHERE
    so.IsActive = 1
    AND so.OrderTypeValue IN (4,5,6,7)
    AND so.SalesOrderGuid = @SalesOrderGuid
  GROUP BY
    ba.AplusAccountNumber
    ,dc.DentalCaseId
    ,so.SalesOrderId
    ,so.RootSalesOrderGuid
    ,so.OrderTypeValue
    ,so.OrderStateValue
    ,soRefine.OrderTypeValue
    ,tms.TrayUseValue
    ,tms.IterationNumber
    ,so.ManufacturingWorkOrderId
    ,so.ReorderReasonValue
	,p.ProductSourceTypeValue
) q
GROUP BY
  q.CompanyNumber
  ,q.AplusAccountNumber
  ,q.DentalCaseId
  ,q.SalesOrderId
  ,q.OrderTypeValue
  ,q.OrderStateValue
  ,q.IsFromRefinement
  ,q.CaseQty
  ,q.TrayUseValue
  ,q.IterationNumber
  ,q.SkuType
  ,q.ManufacturingWorkOrderId
  ,q.ReorderReasonValue
  ,q.ProductSourceTypeValue
) q2
  INNER JOIN CodeSku v ON
    CHARINDEX(CONVERT(NVARCHAR,q2.OrderTypeValue),v.OrderTypeValue) > 0
    --COMMENTED OUT SO I CAN GRAB IT FOR ANY ORDER  CHARINDEX(CONVERT(NVARCHAR,q2.OrderStateValue),v.OrderStateValue) > 0
    AND COALESCE(CASE WHEN v.Sku IN ('70-0009-0944-3','70-0009-0991-4') THEN NULL ELSE v.IsFromRefinement END ,q2.IsFromRefinement,-1) = COALESCE(q2.IsFromRefinement,-1)
    AND COALESCE(v.TrayUseValue,q2.TrayUseValue,-1) = COALESCE(q2.TrayUseValue,-1)
    AND COALESCE(v.SkuType,q2.SkuType,-1) = COALESCE(q2.SkuType,-1)
    AND COALESCE(v.ReorderReasonValue,-1) = COALESCE(q2.ReorderReasonValue,-1)
    --AND COALESCE(v.CanChargeForCancel,@CanChargeForCancel,0) = COALESCE(@CanChargeForCancel,0)  
    AND v.Sku NOT IN ('70-0009-1647-1','70-0009-1635-6')
	AND COALESCE(v.ProductSourceTypeValue,-1) = COALESCE(q2.ProductSourceTypeValue,-1)

  DECLARE @RecCount INT = @@ROWCOUNT

--IF (SELECT COUNT(*) FROM #t_uspGetSalesOrderAplusSkuRef WHERE RefNumber IN ('358-450','358-452')) > 0
--BEGIN
--INSERT INTO #t_uspGetSalesOrderAplusSkuRef 
--SELECT TOP 1
--  CompanyNumber
--  ,AplusAccountNumber
--  ,DentalCaseId
--  ,SalesOrderId
--  ,OrderTypeValue
--  ,OrderStateValue
--  ,IsFromRefinement
--  ,1 AS CaseQty
--  ,TrayUseValue
--  ,IterationNumber
--  ,SkuType
--  ,ManufacturingWorkOrderId
--  ,ReorderReasonValue
--  ,'78-0009-2992-3' AS Sku
--  ,'358-451' AS RefNumber
--  ,'3M Clarity Aligners Carrying Case' AS SkuDescription
--  ,'3M Clarity Aligners Carrying Case' AS ReportDescription
--  FROM
--	#t_uspGetSalesOrderAplusSkuRef
--  WHERE
--	RefNumber IN ('358-450','358-452') --3M Clarity Retainer Kit - Dual Arch, 3M Clarity Retainer Kit - Single Arch
--END

--SELECT * FROM #t_uspGetSalesOrderAplusSkuRef
--DROP TABLE #t_uspGetSalesOrderAplusSkuRef

  /*Update the Log with Row Count and Total Execution Time*/
  SET @ReturnText = CONVERT(NVARCHAR(100),@RecCount) + ' Sku. ' 
  SET @ExecutionTime = CONVERT(TIME,GETUTCDATE() - CONVERT(DATETIME,@ExecutionUtc))
  --EXEC utlProcedureLogInsert @IsEF=@IsEF,@ProcedureName=@MyProcedureName,@ExecutionTime=@ExecutionTime,@ExecutionText=@ExecutionText,@ResultText=@ReturnText,@UserGuid=@UserGuid,@ProcedureLogGuid=@ProcedureLogGuid
  /*End of Log Insert*/
END

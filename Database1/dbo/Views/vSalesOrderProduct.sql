CREATE VIEW vSalesOrderProduct
AS
SELECT
--  q2.CompanyNumber
--  ,q2.AplusAccountNumber
--  ,q2.DentalCaseId
--  ,q2.SalesOrderId
--  ,q2.OrderTypeValue
--  ,q2.OrderStateValue
--  ,q2.IsFromRefinement
--  --,q2.CaseQty
--  ,q2.TrayUseValue
--  ,q2.IterationNumber
--  ,q2.SkuType
--  ,q2.ManufacturingWorkOrderId
--  ,q2.ReorderReasonValue
--  ,v.Sku
--  ,v.RefNumber
--  ,v.SkuDescription
--  ,REPLACE(v.ReportDescription,'<SKUType>',CASE WHEN q2.SkuType = 1 THEN 'SINGLE' WHEN q2.SkuType = 1 THEN 'Dual' ELSE '' END) AS ReportDescription
----  ,ISNULL(v.ReorderReasonValue,q2.ReorderReasonValue) , q2.ReorderReasonValue'
	q2.SalesOrderGUID
	,q2.SalesOrderId
	,v.Sku
	,v.RefNumber
	, COUNT(*) AS ProductQty
FROM (
SELECT
  q.CompanyNumber
  ,q.AplusAccountNumber
  ,q.DentalCaseId
  ,q.SalesOrderGUID
  ,q.SalesOrderId
  ,q.OrderTypeValue
  ,q.OrderStateValue
  ,q.IsFromRefinement
  --,q.CaseQty
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
	,so.SalesOrderGUID
    ,so.SalesOrderId
    ,so.OrderTypeValue
    ,so.OrderStateValue
    ,CASE WHEN soRefine.OrderTypeValue = 7 THEN 1 ELSE 0 END AS IsFromRefinement
    --,ISNULL((SELECT dbo.ufnMaxIterationNumber(SalesOrderGuid) FROM SalesOrder WHERE RootSalesOrderGuid = so.RootSalesOrderGuid AND OrderTypeValue = 2 AND IsActive = 1)
    --       ,(SELECT dbo.ufnMaxIterationNumber(SalesOrderGuid) FROM SalesOrder WHERE RootSalesOrderGuid = so.RootSalesOrderGuid AND OrderTypeValue = 8 AND IsActive = 1)) AS CaseQty
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
    --AND so.SalesOrderGuid = @SalesOrderGuid
  GROUP BY
    ba.AplusAccountNumber
    ,dc.DentalCaseId
	,so.SalesOrderGUID
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
  ,q.SalesOrderGUID
  ,q.SalesOrderId
  ,q.OrderTypeValue
  ,q.OrderStateValue
  ,q.IsFromRefinement
  --,q.CaseQty
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
GROUP BY 
	q2.SalesOrderGUID
	,q2.SalesOrderId
	,v.Sku
	,v.RefNumber


CREATE FUNCTION [dbo].[ufnMaxIterationNumber] (
  @SalesOrderGuid UNIQUEIDENTIFIER )
RETURNS INT
/*
  SELECT *
  FROM 
    TrayManufacturingSpecification tms 
    INNER JOIN OrderItem oi ON 
      oi.OrderItemGuid = tms.TrayManufacturingSpecificationOrderItemGuid 
    INNER JOIN SalesOrder so ON 
      so.SalesOrderGuid = oi.SalesOrderGuid
  WHERE so.SalesOrderGuid = '183E82D5-9886-4EDE-B670-BBD69530EBD8'

*/
AS
BEGIN
  DECLARE @MaxIterationNumber INT 
  SELECT @MaxIterationNumber = MAX(tms.IterationNumber) 
  FROM 
    TrayManufacturingSpecification tms 
    INNER JOIN OrderItem oi ON 
      oi.OrderItemGuid = tms.TrayManufacturingSpecificationOrderItemGuid 
    INNER JOIN SalesOrder so ON 
      so.SalesOrderGuid = oi.SalesOrderGuid
  WHERE so.SalesOrderGuid = @SalesOrderGuid
  
  RETURN @MaxIterationNumber
END
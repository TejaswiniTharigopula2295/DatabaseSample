CREATE PROCEDURE [dwetl].[uspGetLevelObjectDetail]              
 @ETLLevel Int                        
AS              
BEGIN              
 SELECT              
  [ObjectConfigID]              
  ,[ObjectServer]              
  ,[ObjectPath]             
  ,'/Shared/Refined_To_Consumption/'+[ObjectName] as [NotebookPath]          
  ,[ObjectLevel]              
  ,[ObjectSchema]                 
 FROM [dwetl].[objectconfig] OC              
 WHERE OC.[ObjectLevel]= @ETLLevel  
  AND OC.ObjectName <> 'DimDate';              
END   
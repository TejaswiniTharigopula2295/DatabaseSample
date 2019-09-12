CREATE PROCEDURE [etl].[uspGetObjectConfig]            
 @SourceSystem VARCHAR(100),            
 @LandingObject VARCHAR(100)            
AS            
BEGIN            
 SELECT            
  [KeyColumns]            
  ,[LandingServer]            
  ,[LandingPath]           
  ,CASE WHEN [IsIncremental]=1 THEN [LandingObject] + '_'+ CAST([etl].[ToTicks] (DEFAULT) AS VARCHAR(1000)) 
   WHEN [IsIncremental]=0 THEN [LandingObject] END AS [LandingObject]            
  ,[RefinedServer]            
  ,[RefinedPath]            
  ,[RefinedObject]      
  ,[IsIncremental]    
 FROM [etl].[objectconfig] OC            
 WHERE OC.[SourceSystem]= @SourceSystem             
  AND OC.[LandingObject]=@LandingObject;            
END 
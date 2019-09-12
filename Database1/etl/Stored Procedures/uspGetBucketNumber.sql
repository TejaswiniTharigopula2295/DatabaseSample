
CREATE PROCEDURE [etl].[uspGetBucketNumber]    
	@BucketNumber int    
AS    
BEGIN    
	SELECT 
		[SourceSystem]
		,[SourceSchema]
		,[LandingObject] 
	FROM [etl].[ObjectConfig]
	WHERE Bucketnumber=@BucketNumber  
END  

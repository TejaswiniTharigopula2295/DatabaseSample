


CREATE PROCEDURE [etl].[uspGetDeltaData]      
	@SourceSchema VARCHAR(1000)      
	,@SourceTable VARCHAR(1000)      
	,@PipelineName VARCHAR(1000) 
	,@JobControlID VARCHAR(1000)     
AS      
BEGIN      
      
      
 DECLARE @BaseQuery VARCHAR(MAX) = ''      
 DECLARE @DeltaQuery VARCHAR(MAX) = ''      
 DECLARE @FinalQuery VARCHAR(MAX) = ''      
 DECLARE @DeltaColumn VARCHAR(1000) 
 DECLARE @JobStartTime  VARCHAR(100)
 
 SET @JobStartTime= (SELECT convert(varchar(100), JobStartTime, 121)  FROM [ETL].[JOBCONTROL]  WHERE JobControlID=@JobControlID)
     
 IF @JobStartTime IS NULL 
 BEGIN
	SET @JobStartTime = '1901-01-01'
 END
	

 SET @DeltaColumn =       
  (      
   SELECT TOP 1      
    COLUMN_NAME      
   FROM INFORMATION_SCHEMA.COLUMNS      
   WHERE       
    TABLE_SCHEMA = @SourceSchema      
    AND TABLE_NAME = @SourceTable      
    AND COLUMN_NAME IN ('changeutc' , 'createutc')      
   ORDER BY COLUMN_NAME      
  )      
   
SET @BaseQuery =       
 'SELECT *       
 FROM '+ @SourceSchema + '.' + @SourceTable      
      
 IF @DeltaColumn IS NOT NULL      
 BEGIN      
      
  SET @DeltaQuery =       
  '      
  WHERE ['+@DeltaColumn+'] >= (       
   SELECT ISNULL(MAX(JC.[JobStartTime]), ''1900-01-01'') 
   FROM [etl].[JobControl] JC       
    INNER JOIN [etl].[SubJobControl] SJC       
     ON JC.[JobControlID] = SJC.[JobControlID]      
   WHERE SJC.[SubJobName] = ''' + @PipelineName + '''       
    AND SJC.[SubJobStatus] = ''Completed''      
  )    
  and ['+@DeltaColumn+'] <= '''+@JobStartTime+'''
  '      
 END      
      
 SET @FinalQuery =  @BaseQuery + @DeltaQuery      
      
 --SELECT @FinalQuery      
 EXECUTE (@FinalQuery)      

END 

CREATE PROCEDURE [qa].[uspTest_Refined_DBO]              
@Schema as varchar(10),            
@SourceObject as varchar(1000),          
@SubJobControlID as INTEGER              
              
AS              
BEGIN             
 DECLARE @RefinedExceptDBO_Count AS varchar(MAX) =''           
 DECLARE @DBOExceptRefined_Count AS varchar(MAX) =''          
 DECLARE @DBO_Count AS varchar(MAX) =''          
 DECLARE @Refined_Count AS varchar(MAX) =''          
 DECLARE @DeltaColumn AS VARCHAR(1000)          
 DECLARE @Update_Query AS varchar(MAX) =''          
 DECLARE @uspUpdateSubJobControl_qa_Complete AS varchar(MAX) ='' 
 DECLARE @DeltaQuery VARCHAR(MAX) = '' 
  
 DECLARE @Column_List VARCHAR(MAX) = '*'      
     
  select @Column_List =      
   STUFF      
   (      
    (      
    SELECT ', ' +  column_name      
    from information_schema.columns      
    where table_name = @SourceObject     
     and table_schema = 'dbo'      
    for xml PATH ('')      
    )      
    , 1      
    , 1      
    , ''      
   )    
           
           
  SET @DeltaColumn =                 
  (                
   SELECT TOP 1                
    COLUMN_NAME                
   FROM INFORMATION_SCHEMA.COLUMNS                
   WHERE                 
    TABLE_SCHEMA = 'Dbo'               
    AND TABLE_NAME = @SourceObject                
    AND COLUMN_NAME IN ('changeutc' , 'createutc')                
   ORDER BY COLUMN_NAME                
  )                
             
 IF @DeltaColumn IS NOT NULL        
 BEGIN        
        
  SET @DeltaQuery =         
  '        
  WHERE ['+@DeltaColumn+'] >= (         
   SELECT ISNULL(MAX(JC.[JobStartTime]), ''1900-01-01'')   
   FROM [etl].[JobControl] JC         
    INNER JOIN [etl].[SubJobControl] SJC         
     ON JC.[JobControlID] = SJC.[JobControlID]        
   WHERE SJC.[SubJobName] = ''' + @SourceObject + '''         
    AND SJC.[SubJobStatus] = ''Completed''        
  )       
  '        
 END           
            
            
            
 SET @RefinedExceptDBO_Count =           
 'SELECT COUNT(*)  AS RefinedExceptDBO_Count           
  FROM           
 (          
  SELECT '+@Column_List +' FROM ' +@Schema+'.'+@SourceObject+'        
 WHERE SubJobControlID='+CAST (@SubJobControlID AS VARCHAR(10))+'        
  EXCEPT           
  SELECT '+@Column_List +' FROM [dbo].'+@SourceObject+' '+@DeltaQuery+'          
  )          
  A'            
             
             
 SET @DBOExceptRefined_Count = 'SELECT COUNT(*)  AS DBOExceptRefined_Count            
 FROM           
 (SELECT '+@Column_List +' FROM [dbo].'+@SourceObject+' '+@DeltaQuery+'                              
  EXCEPT           
  SELECT '+@Column_List +' FROM ' +@Schema+'.'+@SourceObject+'        
  WHERE SubJobControlID='+ CAST (@SubJobControlID AS VARCHAR(10))+')A'            
            
            
          
            
  SET @DBO_Count= 'SELECT COUNT(*) as DBO_Count FROM [dbo].'+@SourceObject +'        
    WHERE SubJobControlID='+ CAST (@SubJobControlID AS VARCHAR(10))          
          
            
  SET @Refined_Count='SELECT COUNT(*)  as Refined_Count FROM ' +@Schema+'.'+@SourceObject +'        
    WHERE SubJobControlID='+ CAST (@SubJobControlID AS VARCHAR(10))         
            
  SET @Update_Query=          
  'UPDATE [qa].[SubJobControl]           
  SET           
  [DBO_Count]=('+@DBO_Count+'),          
            
  [Refined_Count]=('+@Refined_Count+'),          
            
  [DBOExceptRefined_Count] =('+@DBOExceptRefined_Count+'),          
            
  [RefinedExceptDBO_Count] = ('+@RefinedExceptDBO_Count+')          
       
  WHERE SubJobControlID='+ CAST (@SubJobControlID AS VARCHAR(10))          
            
  ----SELECT (@Update_Query)          
            
  EXEC (@Update_Query)          
            
  SET @uspUpdateSubJobControl_qa_Complete=          
  'UPDATE [qa].[SubJobControl]          
  SET          
  [DataValidationStatus]=CASE WHEN [DBO_Count]=[Refined_Count] AND [DBOExceptRefined_Count]=0          
  AND [RefinedExceptDBO_Count]=0 THEN ''Passed'' ELSE ''Failed'' END,          
  [SubJobErrorMessage]=''NULL'',          
  [SubJobStatus]=''Completed'',      
  [SubJobEndTime] = SYSUTCDATETIME()             
  WHERE SubJobControlID='+ CAST (@SubJobControlID AS VARCHAR(10))          
            
  EXEC (@uspUpdateSubJobControl_qa_Complete)          
            
END 

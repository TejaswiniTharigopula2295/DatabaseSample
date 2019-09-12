CREATE PROCEDURE [qa].[uspCreateDLTablesQA_Landing]      
      
@Schema as varchar(10),    
@SourceObject as varchar(1000)      
      
AS      
BEGIN      
 DECLARE @Query AS varchar(MAX)   
 DECLARE @ALTERQUERY AS varchar(MAX)  
 DECLARE @dp_Query AS VARCHAR(1000)    
   
 SET @dp_Query = 'DROP TABLE IF EXISTS ' +@Schema+'.'+@SourceObject       
 EXEC (@dp_Query)      
      
       
        
 DECLARE @Column_List VARCHAR(MAX) = '*'      
      
 --if @SourceObject = 'aspnetusers'      
 --begin      
  select @Column_List =      
   STUFF      
   (      
    (      
    SELECT ', ' +       
     CASE WHEN DATA_TYPE = 'uniqueidentifier'      
      THEN 'CAST(' + column_name  + ' as varchar(256)) as ' + column_name  + ''      
      ELSE column_name      
     END      
    from information_schema.columns      
    where table_name = @SourceObject      
     and table_schema = 'dbo'      
    for xml PATH ('')      
    )      
    , 1      
    , 1      
    , ''      
   )      
 --end      
      
 SET @Query = 'SELECT ' + @Column_List + ' INTO ' +@Schema+'.'+@SourceObject+' FROM [dbo].'+@SourceObject+ ' WHERE 1=2'      
 EXEC (@Query)      
    
END    

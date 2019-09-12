CREATE PROCEDURE [qa].[uspTruncateCONSDLTablesQA]    
    
@Schema as varchar(10),  
@SourceObject as varchar(1000)    
    
AS    
BEGIN    
 DECLARE @Query AS varchar(MAX), @dp_Query AS VARCHAR(1000)    
 SET @dp_Query = 'TRUNCATE TABLE ' +@Schema+'.'+@SourceObject     
 EXEC (@dp_Query)       
    
END 
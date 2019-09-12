CREATE procedure [dwetl].[uspInsertSubJobDetail]        
@SubJobDetailName varchar(1000)         
,@JobControlID Int     
,@SubJobControlID Int       
as        
begin        
 DECLARE @Current_date DATETIME = SYSUTCDATETIME()        
 INSERT INTO  SubJobDetail         
 (         
 JobControlID   
 ,SubJobControlID  
 ,SubJobDetailName             
 ,SubJobDetailStartTime          
 ,SubJobDetailStatus          
 )         
 VALUES          
 (         
 @JobControlID    
, @SubJobControlID    
 ,@SubJobDetailName 
 ,@Current_date          
 ,'In Progress'         
 )         
        
         
        
 DECLARE @SubJobDetailID INT =          
 (         
 SELECT SubJobDetailID         
 FROM dwetl.SubJobDetail         
 WHERE 
 SubJobDetailName = @SubJobDetailName         
 AND SubJobDetailStartTime = @Current_date         
 AND JobControlID = @JobControlID     
 AND SubJobControlID = @SubJobControlID   
 )        
 select cast(@SubJobDetailID as varchar(10)) as SubJobDetailID        
end 
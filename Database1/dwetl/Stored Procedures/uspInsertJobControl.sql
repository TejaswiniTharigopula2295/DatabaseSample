CREATE procedure [dwetl].[uspInsertJobControl]        
@JobName varchar(1000)          
as        
begin        
 DECLARE @Current_date DATETIME = SYSUTCDATETIME()          
 INSERT INTO  dwetl.JobControl          
 (         
  JobName           
  ,JobStartTime          
  ,JobStatus          
 )         
 VALUES          
 (         
  @JobName         
  ,@Current_date         
  ,'In Progress'         
 )         
         
 DECLARE @JobControlID INT =          
 (         
  SELECT JobControlID         
  FROM dwetl.JobControl         
  WHERE JobName = @JobName        
  AND JobStartTime = @Current_date         
 )         
 select cast(@JobControlID as varchar(10)) as JobControlID        
end    ;
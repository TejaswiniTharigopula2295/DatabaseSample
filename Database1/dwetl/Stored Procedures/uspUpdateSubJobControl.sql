CREATE procedure [dwetl].[uspUpdateSubJobControl]    
@SubJobControlID INT    
,@SubJobStatus VARCHAR(100)    
as    
begin    
 UPDATE SJC     
 SET  SubJobEndTime = SYSUTCDATETIME()       
 ,SubJobStatus=@SubJobStatus  
 FROM dwetl.SubJobControl SJC     
 WHERE SJC.SubJobControlID = @SubJobControlID    
end 
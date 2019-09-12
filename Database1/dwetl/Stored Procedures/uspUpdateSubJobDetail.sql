CREATE procedure [dwetl].[uspUpdateSubJobDetail]      
@SubJobDetailID INT       
,@SubJobDetailError VARCHAR(2000)     
,@SubJobDetailStatus VARCHAR(100)    
as      
begin      
 UPDATE SJD      
 SET  SubJobDetailEndTime = SYSUTCDATETIME()       
 ,SubJobDetailStatus = @SubJobDetailStatus     
 ,SubJobDetailError=@SubJobDetailError  
 ,LastProcessedDateTime= SYSUTCDATETIME()
 FROM SubJobDetail SJD      
 WHERE SJD.SubJobDetailID = @SubJobDetailID      
end 
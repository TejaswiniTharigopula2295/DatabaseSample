CREATE procedure [qa].[uspUpdateSubJobControl_qa]          
@SubJobControlID INT          
,@SubJobStatus VARCHAR(100)          
,@SubJobErrorMessage VARCHAR(2000)  
,@DataValidationStatus VARCHAR(100)           
as          
begin          
 UPDATE SJC           
 SET  SubJobEndTime = SYSUTCDATETIME()           
 ,SubJobStatus = @SubJobStatus         
 ,SubJobErrorMessage=@SubJobErrorMessage  
 ,DataValidationStatus=@DataValidationStatus  
 FROM [qa].[SubJobControl] SJC           
 WHERE SJC.SubJobControlID = @SubJobControlID          
end 
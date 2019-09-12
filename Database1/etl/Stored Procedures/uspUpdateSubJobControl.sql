CREATE procedure [etl].[uspUpdateSubJobControl]  
@SubJobControlID INT  
,@LandingStatus VARCHAR(100)  
,@LandingErrorMessage VARCHAR(2000) 
,@SubJobStatus VARCHAR(100)
as  
begin  
 UPDATE SJC   
 SET  landingEndTime = SYSUTCDATETIME()   
 ,LandingStatus = @LandingStatus 
 ,LandingErrorMessage=@LandingErrorMessage
 ,SubJobStatus=@SubJobStatus
 FROM SubJobControl SJC   
 WHERE SJC.SubJobControlID = @SubJobControlID  
end  

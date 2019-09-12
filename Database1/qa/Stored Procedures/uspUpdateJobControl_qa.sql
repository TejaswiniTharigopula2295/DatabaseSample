CREATE procedure [qa].[uspUpdateJobControl_qa]          
@JobControlID INT       
as          
Begin          
 UPDATE JC           
 SET JobEndTime = SYSUTCDATETIME()           
 ,JobStatus = CASE WHEN  (  
         SELECT COUNT(*)  
         FROM [qa].[SubJobControl] SJC  
         WHERE JC.[JobControlID] = SJC.[JobControlID]  
          AND SJC.[SubJobStatus] <> 'Completed'  
        ) > 0  
       THEN 'Failed'  
      ELSE 'Completed'  
     END      
 FROM [qa].[JobControl] JC          
 WHERE JC.JobControlID=@JobControlID       
end  
    
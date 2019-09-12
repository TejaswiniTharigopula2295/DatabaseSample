 CREATE procedure [etl].[uspUpdateJobControl]          
@JobControlID INT       
as          
Begin          
 UPDATE JC           
 SET JobEndTime = SYSUTCDATETIME()           
 ,JobStatus = CASE WHEN  (  
         SELECT COUNT(*)  
         FROM [etl].[SubJobControl] SJC  
         WHERE JC.[JobControlID] = SJC.[JobControlID]  
          AND SJC.[SubJobStatus] <> 'Completed'  
        ) >0  
       THEN 'Failed'  
      ELSE 'Completed'  
     END      
 FROM [etl].[JobControl] JC          
 WHERE JC.JobControlID=@JobControlID       
end  
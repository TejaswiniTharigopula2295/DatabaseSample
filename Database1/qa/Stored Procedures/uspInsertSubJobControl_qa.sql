﻿CREATE procedure [qa].[uspInsertSubJobControl_qa]          
@SubJobName varchar(1000)           
,@JobControlID Int          
as          
begin          
 DECLARE @Current_date DATETIME = SYSUTCDATETIME()          
 INSERT INTO  [qa].[SubJobControl]            
 (           
 JobControlID           
 ,SubJobName              
 ,SubJobStartTime            
 ,SubJobStatus            
 )           
 VALUES            
 (           
 @JobControlID           
 ,@SubJobName           
 ,@Current_date            
 ,'In Progress'           
 )           
          
           
          
 DECLARE @SubJobControlID INT =            
 (           
 SELECT SubJobControlID           
 FROM [qa].[SubJobControl]           
 WHERE SubJobName = @SubJobName           
 AND SubJobStartTime = @Current_date           
 AND JobControlID = @JobControlID           
 )          
 select cast(@SubJobControlID as varchar(10)) as SubJobControlID          
end   
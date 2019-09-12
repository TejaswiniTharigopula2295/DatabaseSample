CREATE procedure [dwetl].[uspFailureRerun]          
@ETLLevel Int     
,@SubJobControlID Int           
,@JobControlID Int  
       
as          
begin          
   
 SELECT 
 '/Users/shanthan.penubadi@ggktech.com/'+[SubJobDetailName] as [NotebookPath2]          
 FROM dwetl.SubJobDetail          
 WHERE SubJobControlID = @SubJobControlID                   
 AND JobControlID = @JobControlID   
 AND SubJobDetailStatus <> 'Completed' 
 union
  SELECT 
 '/Users/shanthan.penubadi@ggktech.com/'+[ObjectName] as [NotebookPath2]
 FROM dwetl.ObjectConfig
 WHERE ObjectName NOT IN (select 
 SubJobDetailName from dwetl.SubJobDetail          
 WHERE SubJobControlID = @SubJobControlID                   
 AND JobControlID = @JobControlID)
 and ObjectLevel=@ETLLevel
 and ObjectName<>'DimDate'

         
end 
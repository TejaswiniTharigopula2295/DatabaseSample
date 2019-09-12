CREATE FUNCTION [dbo].[ufnFirstLastName]  
(  
    @UserGuid UNIQUEIDENTIFIER  
)  
RETURNS NVARCHAR(255)  
AS  
BEGIN  
    DECLARE @Result NVARCHAR(255) = (SELECT FirstLastName FROM AspNetUsers WHERE Id = @UserGuid)  
      
    RETURN @Result  
END  
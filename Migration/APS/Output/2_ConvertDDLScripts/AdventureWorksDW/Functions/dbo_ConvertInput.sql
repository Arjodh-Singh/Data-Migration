CREATE FUNCTION aw.[ConvertInput] (@MyValueIn [int]) RETURNS decimal(10,2)
AS
BEGIN  
    DECLARE @MyValueOut int;  
    SET @MyValueOut= CAST( @MyValueIn AS decimal(10,2));  
    RETURN(@MyValueOut);  
END


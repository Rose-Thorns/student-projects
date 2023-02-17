use TestBase;
GO

---1---
--IF OBJECT_ID (N'udf_print', N'FN') IS NOT NULL  
--    DROP FUNCTION udf_print;  
--GO  
--CREATE FUNCTION udf_print(@name nvarchar(20))  
--RETURNS nvarchar(30)
--AS
--BEGIN
--	RETURN 'Hello, ' + @name;
--END
--go
--declare @res nvarchar(30)
--exec @res=udf_print 'Ivan'
--print @res

-----2-----
--IF OBJECT_ID (N'udf_mins', N'FN') IS NOT NULL  
--    DROP FUNCTION udf_mins;  
--GO  
--CREATE FUNCTION udf_mins()  
--RETURNS int
--AS
--BEGIN
--	RETURN datepart(minute, getdate())
--END
--go

--declare @res int
--exec @res = udf_mins
--print @res

-------3--------
--IF OBJECT_ID (N'udf_year', N'FN') IS NOT NULL  
--    DROP FUNCTION udf_year;  
--GO  
--CREATE FUNCTION udf_year()  
--RETURNS int
--AS
--BEGIN
--	RETURN datepart(year, getdate())
--END
--go

--declare @res int
--exec @res = udf_year
--print @res

--------4-------
--IF OBJECT_ID (N'udf_even_or_odd_year', N'FN') IS NOT NULL  
--    DROP FUNCTION udf_even_or_odd_year;  
--GO  
--CREATE FUNCTION udf_even_or_odd_year()  
--RETURNS nvarchar(15)
--AS
--BEGIN
--	declare @res nvarchar(15)
--	if datepart(year, getdate()) / 2 = 0
--		set @res = N'Even year'
--	else
--		set @res = N'Odd year'
--	return @res
--END
--go

--declare @res nvarchar(15)
--exec @res = udf_even_or_odd_year
--print @res

-------5---------
IF OBJECT_ID (N'udf_is_prime', N'FN') IS NOT NULL  
    DROP FUNCTION udf_is_prime;  
GO  
CREATE FUNCTION udf_is_prime(@num int)  
RETURNS nvarchar(15) 
AS
BEGIN
	declare @res nvarchar(15)
	declare @tmp int = 2
	while (@num % @tmp != 0)
		set @tmp += 1
	if @tmp = @num
		set @res = 'yes'
	else 
		set @res = 'no'
	return @res
END
go

declare @res nvarchar(15)
exec @res = udf_is_prime 11
print @res

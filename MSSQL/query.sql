--PRINT 'Hello, world'
--DECLARE @a int = 3, @b int = 15, @res int
--SET @res = @a + @b;
--PRINT @res;

--IF (@a > @b)
--	PRINT @a
--ELSE 
--	PRINT @b

--WHILE @a < @b
--BEGIN 
--	PRINT @a
--	SET @a += 1
--END 

--use CompStore;
--go

--create procedure sp_hello
--as 
--print 'Hello world'

--exec sp_hello

--create procedure sp_sum;1 @a int, @b int
--as 
--declare @res int 
--set @res = @a+@b
--print @res
--go

--create procedure sp_sum;2 @a int, @b int
--as 
--declare @res int 
--set @res = @a+@b
--return @res

--exec sp_sum;1 2, 5

--declare @res int
--exec @res = sp_sum;2 @b = 123, @a = 567
--print @res



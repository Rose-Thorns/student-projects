use TestDatabase
go 

----1----
--if object_id('sp_hello', 'p') is not null
--	drop procedure sp_hello;
--go
--create procedure sp_hello
--as
--print 'Hello world';

--exec sp_hello;

----2----
--if object_id('sp_get_time', 'p') is not null
--	drop procedure sp_get_time;
--go
--create procedure sp_get_time @t time output
--as
--set @t = convert(time, getdate());

--declare @t time;
--exec sp_get_time @t output

--print @t

----3----
--if object_id('sp_get_date', 'p') is not null
--	drop procedure sp_get_date;
--go
--create procedure sp_get_date @d date output
--as
--set @d = convert(date, getdate());

--declare @d date;
--exec sp_get_date @d output

--print @d


----6----
--if object_id('sp_get_max', 'p') is not null
--	drop procedure sp_get_max;
--go
--create procedure sp_get_max @a int, @b int, @c int
--as
--declare @max int = @a
--if (@max > @b)
--begin
--	if (@max > @c)
--		return @max
--	else
--		return @c
--end
--else
--	return @b;

--declare @max int
--exec @max = sp_get_max 2, 1, 7
--print @max;

----8----
--if object_id('sp_print_char', 'p') is not null
--drop procedure sp_print_char;
--go
--create procedure sp_print_char @a int, @char nvarchar
--as
--while @a > 0
--begin	
--	select concat(@char, '', @char);
--	@a -= 1;
--end

----uf----
--if object_id('uf_hello', 'p') is not null
--	drop function uf_hello;
--go
--create function uf_hello()
--returns nvarchar(20)
--as
--begin
--	return N'Hello world'
--end

--declare @h nvarchar(20)
--exec @h = uf_hello
--print @h

----sum----
--if object_id('uf_sum', 'p') is not null
--	drop function uf_sum;
--go
--create function uf_sum(@a int, @b int, @c int)
--returns int
--as
--begin
--	return (@a + @b + @c)
--end;
--go

--declare @res int
--exec @res = uf_sum 1, 2, 3
--print @res
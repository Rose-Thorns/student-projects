--use CompStore
--go

--create procedure sp_fact @num int
--as 
--declare @fact  int = 1
--while @num > 1
--begin	
--	set @fact *= @num
--	set @num -= 1;
--end
--print @fact

--exec sp_fact 5

----error message
--raiserror (N'Today is %d %s %d', 10, 1, 16, 'November', 2019)

--create procedure sp_get_all_pc
--as
--select *
--from pc

--exec sp_get_all_pc

--create procedure sp_get_pc_with_price_more @price decimal
--as
--select *
--from pc
--where price > @price 

--exec sp_get_pc_with_price_more 600

/*
Triggers:
	-After
	-Instead of
*/

--drop trigger add_confirm

--create trigger add_confirm
--on pc after insert
--as
--print 'New pc was added'

--insert into pc 
--values
--(1232, 664, 256, 48, '30x', 1000.00)

--create trigger add_confirm
--on pc after insert
--as
--select *
--from inserted

--create trigger print_deleted
--on pc after delete
--as
--select*
--from deleted

--delete from pc
--where speed < 500


use IndexesDB
go
/*
set statistics io on
set statistics time on
--include live query statistics
*/
select *
from user_details
where user_id = 456;

create index ix_user_details_username /*unique, clustered, non clostered*/
on user_details(username);

select user_id, username, first_name
from user_details
where username = 'mike28';

drop index ix_user_details_username on user_details;

create index ix_user_details_username
on user_details(username) include (first_name)
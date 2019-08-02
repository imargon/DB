select id,state,name from tab
where state = '0'
and id not in ( select id from 
(select id,state,name from tab where state = '1' ) )
union all
select id,state,name from tab where state = '1'

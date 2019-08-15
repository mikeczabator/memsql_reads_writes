delimiter // 

create or replace procedure memsql_reads_writes(ps int) returns void as

declare 

prev_reads bigint=0;
prev_writes bigint=0;
cur_reads bigint=0;
cur_writes bigint=0;

my_name varchar(25);
my_value bigint;
d int;
loop_num bigint = 0;

q QUERY(v_name varchar(25), v_value bigint)= select variable_name, variable_value from information_schema.global_status where variable_name in ('Rows_affected_by_writes','Rows_returned_by_reads');


begin

while true loop
	for r in collect(q) loop
		my_name = r.v_name;
        my_value = r.v_value;        

        if (my_name = 'Rows_affected_by_writes') then
			cur_writes = my_value;
		elsif (my_name = 'Rows_returned_by_reads' ) then 
			cur_reads = my_value;
		end if;
	end loop;
    
	if loop_num != 0 then
		echo select format(cur_writes-prev_writes,0) as 'writes', format(cur_reads-prev_reads,0) as 'reads', concat('per ',ps,' second(s)') as "rate";
    	else
		echo select concat("monitoring ",ps," seconds for first iteration...") as msg;
	end if;
	
	
	prev_reads=cur_reads;
	prev_writes=cur_writes;
	
	if loop_num != 0 then
		d= sleep(ps);
	end if;
    	loop_num+=1;
end loop;


end 
//
delimiter ;




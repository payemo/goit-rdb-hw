use goit;

# 5. Створити функцію з двома параметрами, яка буде ділити перший параметр на другий. 
#	Обидва параметри та значення, що повертається, повинні мати тип FLOAT.
drop function if exists goit.divide;

delimiter //

create function divide(param1 FLOAT, param2 FLOAT)
returns FLOAT
deterministic
no sql
begin
	declare output FLOAT;
    
    if param2 = 0 then
		return NULL;
	end if;
    
    set output = param1 / param2;
	return output;
end //

delimiter ;

select *, round(divide(quantity, 2.0), 2) as divided_quantity
from order_details;

select *, round(divide(quantity, 0.0), 2) as divided_quantity
from order_details;

select *, round(divide(quantity, 15.0), 2) as divided_quantity
from order_details;

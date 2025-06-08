use goit;

# 1. Відобразити таблицю order_details та поле customer_id 
# 	з таблиці orders відповідно для кожного поля запису з таблиці order_details.
select od.*,
	(select customer_id from orders as o
	where o.id = od.order_id) as customer_id
from order_details as od;

# 2. Відобразити таблицю order_details. Відфільтрувати результати так, щоб відповідний запис із 
#	таблиці orders виконував умову shipper_id=3
select od.*
from order_details as od
where od.order_id in (
	select o.id from orders as o
    where o.shipper_id = 3);
    
# 3. Написати SQL запит, вкладений в операторі FROM, який буде обирати рядки з умовою quantity>10 з 
#	таблиці order_details. Для отриманих даних знайти середнє значення поля quantity — групувати слід за order_id.
select 
	tmp_table.order_id,
    floor(avg(tmp_table.quantity)) as avg_quantity
from (
	select * from order_details
    where quantity > 10
) as tmp_table
group by tmp_table.order_id;

# 4.Розв'язати попереднє завдання, використовуючи оператор WITH для створення тимчасової таблиці temp. 
with order_details_cte as (
	select *
    from order_details
    where quantity > 10
)
select 
	order_id, 
    floor(avg(quantity)) as avg_quantity
from order_details_cte
group by order_id;

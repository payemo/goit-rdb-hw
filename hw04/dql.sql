use goit;

# 4.1 Визначити кількість рядків
select *
from order_details as od
inner join orders as o
	on o.id = od.order_id
inner join customers as c
	on c.id = o.customer_id
inner join employees as e
	on e.employee_id = o.employee_id
inner join shippers as s
	on s.id = o.shipper_id
inner join products as p
	on p.id = od.product_id
inner join suppliers as sup
	on sup.id = p.supplier_id
inner join categories as cat
	on cat.id = p.category_id;

# 4.3 Вибрати рядки, де 3 > 'employee_id' <= 10
select *
from orders as o
inner join order_details as od
	on o.id = od.order_id
inner join products as p
	on od.product_id = p.id
where o.employee_id between 4 and 10;

# 4.4 Згрупувати за іменем категорії, порахувати кількість рядків у групі, середню кількість товару
select
	cat.name as category_name,
    count(p.id) as products_per_category,
    avg(od.quantity) as average_orders_amount
from order_details as od
inner join orders as o
	on o.id = od.order_id
inner join customers as c
	on c.id = o.customer_id
inner join employees as e
	on e.employee_id = o.employee_id
inner join shippers as s
	on s.id = o.shipper_id
inner join products as p
	on p.id = od.product_id
inner join suppliers as sup
	on sup.id = p.supplier_id
inner join categories as cat
	on cat.id = p.category_id
group by cat.name

# 4.5 Відфільтрувати рядки, де середня кількість товару більша з 21
select
	cat.name as category_name,
    count(p.id) as products_per_category,
    round(avg(od.quantity), 2) as average_orders_amount
from order_details as od
inner join orders as o
	on o.id = od.order_id
inner join customers as c
	on c.id = o.customer_id
inner join employees as e
	on e.employee_id = o.employee_id
inner join shippers as s
	on s.id = o.shipper_id
inner join products as p
	on p.id = od.product_id
inner join suppliers as sup
	on sup.id = p.supplier_id
inner join categories as cat
	on cat.id = p.category_id
group by cat.name
having average_orders_amount > 21;

# 4.6 Відсортувати в порядку спадання по кількості рядків
select
	cat.name as category_name,
    count(p.id) as products_per_category,
    round(avg(od.quantity), 2) as average_orders_amount
from order_details as od
inner join orders as o
	on o.id = od.order_id
inner join customers as c
	on c.id = o.customer_id
inner join employees as e
	on e.employee_id = o.employee_id
inner join shippers as s
	on s.id = o.shipper_id
inner join products as p
	on p.id = od.product_id
inner join suppliers as sup
	on sup.id = p.supplier_id
inner join categories as cat
	on cat.id = p.category_id
group by cat.name
having average_orders_amount > 21
order by products_per_category desc;

# 4.7 Вивести на екран (оберіть) чотири рядки з пропущеним першим рядком.
select
	cat.name as category_name,
    count(p.id) as products_per_category,
    round(avg(od.quantity), 2) as average_orders_amount
from order_details as od
inner join orders as o
	on o.id = od.order_id
inner join customers as c
	on c.id = o.customer_id
inner join employees as e
	on e.employee_id = o.employee_id
inner join shippers as s
	on s.id = o.shipper_id
inner join products as p
	on p.id = od.product_id
inner join suppliers as sup
	on sup.id = p.supplier_id
inner join categories as cat
	on cat.id = p.category_id
group by cat.name
having average_orders_amount > 21
order by products_per_category desc
limit 4
offset 1;
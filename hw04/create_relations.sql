use goit;

# Створити PRIMARY KEY для кожної таблиці
alter table categories add primary key(id);
alter table customers add primary key(id);
alter table employees add primary key(employee_id);
alter table order_details add primary key(id);
alter table orders add primary key(id);
alter table products add primary key(id);
alter table shippers add primary key(id);
alter table suppliers add primary key(id);

alter table order_details
add constraint fk_order_id foreign key (order_id) references orders(id),
add constraint fk_product_id foreign key (product_id) references products(id);

alter table orders
add constraint fk_customer_id foreign key (customer_id) references customers(id),
add constraint fk_employee_id foreign key (employee_id) references employees(employee_id),
add constraint fk_shipper_id foreign key (shipper_id) references shippers(id);

alter table products
add constraint fk_supplier_id foreign key (supplier_id) references suppliers(id),
add constraint fk_category_id foreign key (category_id) references categories(id);


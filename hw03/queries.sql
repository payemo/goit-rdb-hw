# 1. Вибрати всі стовпчики (За допомогою wildcard “*”) з таблиці products
select * from products;
# 1. вибрати тільки стовпчики name, phone з таблиці shippers,
select name, phone from shippers;

# 2.Напишіть SQL команду, за допомогою якої можна знайти середнє,
# максимальне та мінімальне значення стовпчика price таблички products.
select
	avg(price) as avg_price,
    min(price) as min_price,
    max(price) as max_price
from products;

# 3. Напишіть SQL команду, за допомогою якої можна обрати унікальні значення 
# колонок category_id та price таблиці products.
select distinct category_id, price
from products order by category_id;

# 4. Напишіть SQL команду, за допомогою якої можна знайти кількість продуктів 
# (рядків), які знаходиться в цінових межах від 20 до 100
select count(*) as products
from products
where price between 20 and 100;

# 5. Напишіть SQL команду, за допомогою якої можна знайти кількість продуктів (рядків) та 
# середню ціну (price) у кожного постачальника (supplier_id)
select
	supplier_id,
    count(*) as products_per_supplier,
    round(avg(price), 2) as avg_price_per_supplier
from products
group by supplier_id;


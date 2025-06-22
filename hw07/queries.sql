# 1.Написати SQL-запит, який для таблиці orders з атрибута date витягує рік, місяць і число. 
# Вивести на екран їх у три окремі атрибути поряд з атрибутом id та оригінальним атрибутом date (всього вийде 5 атрибутів).
select
	id as order_id,
	year(o.date) as year,
    month(o.date) as month,
    day(o.date) as day,
    o.date
from orders as o;

# 2.Написати SQL-запит, який для таблиці orders до атрибута date додає один день. 
# На екран вивести атрибут id, оригінальний атрибут date та результат додавання.
select
	o.id,
    o.date,
    date_add(o.date, interval 1 day) as next_day
from orders as o;

# 3. Написати SQL-запит, який для таблиці orders для атрибута date 
#	відображає кількість секунд з початку відліку (показує його значення timestamp). 
#	Для цього потрібно знайти та застосувати необхідну функцію. 
#	На екран вивести атрибут id, оригінальний атрибут date та результат роботи функції.
select
	o.id,
    o.date,
    unix_timestamp(o.date) as timestamp
from orders as o;

# 4. Написати SQL-запит, який рахує, скільки таблиця orders містить рядків 
#	з атрибутом date у межах між 1996-07-10 00:00:00 та 1996-10-08 00:00:00.
select
	count(*) as total_orders
from orders as o
where o.date between '1996-07-10' and '1996-10-08';

# 5. Написати SQL-запит, який для таблиці orders виводить на екран атрибут id, атрибут date та JSON-об’єкт 
#	{"id": <атрибут id рядка>, "date": <атрибут date рядка>}. Для створення JSON-об’єкта використати функцію.
select 
	o.id,
    o.date,
    json_object('id', o.id, 'date', o.date) as json_obj
from orders as o;


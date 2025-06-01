use LibraryManagement;

insert into authors (author_name)
values
    ('Оксана Забужко'),
    ('Тарас Шевченко');

insert into genres (genre_name)
values 
    ('Поезія'),
    ('Роман');

insert into books (title, publication_year, author_id, genre_id)
values 
    ('Польові дослідження з українського сексу', 1996, 1, 2),
    ('Кобзар', 1840, 2, 1);

insert into users (username, email)
values 
    ('ivan23', 'ivan23@example.com'),
    ('olena_k', 'olena.k@example.com');

insert into borrowed_books (book_id, user_id, borrow_date, return_date)
values 
    (1, 1, '2025-05-25', '2025-06-01'),
    (2, 2, '2025-05-28', NULL); -- ще не повернула

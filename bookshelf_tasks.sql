-- 1 Найти автора с самым большим числом книг и вывести его имя
select authors.name, count(authors.name) -- as 'Кол. книг'
from db_a203f4.authors
join authors_books ON authors.id = authors_books.authors_id
group by authors.name
order by count(authors.name) desc
limit 1
;
-- 2 Вывести пять самых старых книг у которых указан год издания
select title, year
from db_a203f4.books
where year like '%%'
order by year asc
limit 5
;
-- 3 Вывести общее количество книг на полке в кабинете
select count(shelves.title)
from shelves
join books on shelves.id = books.shelves_id
where shelves.title =  'Полка в кабинете'
;
-- 4 Вывести названия, имена авторов и годы издания книг, которые находятся на полке в спальне
select books.title, authors.name, books.year
from db_a203f4.books
join shelves on books.shelves_id = shelves.id
join authors_books on books.id = authors_books.books_id
join authors on authors_books.authors_id = authors.id
where shelves.title = 'Полка в спальне'
;
-- 5 Вывести названия и годы издания книг, написанных автором 'Лев Толстой'
select books.title, books.year
from books
join authors_books on books.id = authors_books.books_id
join authors on authors_books.authors_id = authors.id
where authors.name = 'Лев Толстой'
;
-- 6 Вывести название книг, которые написали авторы, чьи имена начинаются на букву "А"
select books.title
from books
join authors_books on books.id = authors_books.books_id
join authors on authors_books.authors_id = authors.id
where authors.name like 'А%'
;
-- 7 Вывести название книг и имена авторов для книг, которые находятся на полках, названия которых включают слова «верхняя» или «нижняя»
select books.title, authors.name
from books
join shelves on books.shelves_id = shelves.id
join authors_books on books.id = authors_books.books_id
join authors on authors_books.authors_id = authors.id
where shelves.title like 'Верхняя %' or 'Нижняя %'
;
-- 8 Книгу «Божественная комедия» автора «Данте Алигьери» одолжили почитать другу Ивану Иванову, необходимо написать один или несколько запросов которые отразят это событие в БД
update books
set books.friends_id = '1'
where books.title = 'Божественная комедия'
limit 1000
;
-- 9 Добавить в базу книгу «Краткие ответы на большие вопросы», год издания 2020, автор «Стивен Хокинг», положить ее на полку в кабинете
insert into books (books.title, books.year, books.shelves_id)
values ('Краткие ответы на большие вопросы', '2020', '1')

insert into authors (name)
values ('Стивен Хокинг')

insert into authors_books (books_id, authors_id)
values ('176', '145');
SELECT * FROM db_a203f4.authors_books
;

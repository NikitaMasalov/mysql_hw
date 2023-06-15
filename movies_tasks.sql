-- 1. Вывести сколько фильмов сняла кинокомпания Universal Pictures
SELECT *
FROM db_a203f4.movies
join companies on movies.companies_id = companies.id
where companies.title = 'Universal Pictures'
;
-- 2. Вывести сколько всего фильмов было снято режиссером Фрэнсисом Фордом Копполой
select *
from db_a203f4.movies
join directors on movies.directors_id = directors.id
where directors.full_name = 'Фрэнсис Форд Коппола';
-- 3. Вывести количество снятых фильмов за последние 20 лет
select*
from movies
where  curdate();
-- 4.Вывести все жанры фильмов в которых снимал Стивен Спилберг в течении всей своей карьеры
select distinct genres.title
from movies
join genres on movies.genres_id = genres.id
join directors on movies.directors_id = directors.id
where directors.full_name = 'Стивен Спилберг';
-- 5. Вывести названия, жанры и режиссеров 5 самых дорогих фильмов
select movies.title, genres.title, directors.full_name
from movies
join genres on movies.genres_id = genres.id
join directors on movies.directors_id = directors.id
order by movies.budget desc
limit 5;
-- 6. Вывести имя режиссера с самым большим количеством фильмов
select directors.full_name
from movies
join directors on movies.directors_id = directors.id
group by directors.full_name
order by count(directors.full_name) desc
limit 1;
-- 7. Вывести названия и жанры фильмов, снятые самой большой кинокомпанией (по сумме всех бюджетов фильмов)
SELECT *
FROM db_a203f4.movies
join companies on movies.companies_id = companies.id
join genres on movies.genres_id = genres.id
where companies.title = (
select sum(movies.budget)
from companies
group by companies.title
order by sum(movies.budget) desc
limit 1);
-- 8 ывести средний бюджет фильмов, снятых кинокомпанией Warner Bros.
SELECT avg(movies.budget)
FROM db_a203f4.movies
join companies on movies.companies_id = companies.id
join genres on movies.genres_id = genres.id
where companies.title = 'Warner Bros.';
-- 9. Вывести количество фильмов каждого жанра и средний бюджет по жанру
select count(movies.title), genres.title, avg(movies.budget)
from movies
join genres on movies.genres_id = genres.id
group by genres.title;
-- 10. Найти и удалить комедию "Дикие истории" 2014-го года
delete from movies
where movies.title = 'Дикие истории' and genres.title = 'комедия'
limit 1000

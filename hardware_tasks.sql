-- 1 Вывести суммарное количество единиц техники на складе (не товарных позиций, а товаров!)
SELECT sum( hardware.amount) as "товаров на складе"
FROM db_a203f4.hardware;
-- 2
Select *
from db_a203f4.hardware
WHERE hardware.amount = 0
;
-- 3 Вывести среднюю цену монитора
SELECT sum(hardware.price / 13)
FROM db_a203f4.hardware
WHERE hardware.title like '%Монитор%'
;
-- 4 Вывести все клавиатуры, при этом результаты отсортировать от самой дешевой до самой дорогой
SELECT * 
FROM db_a203f4.hardware
where hardware.title Like '%Клавиат%'
order by hardware.price asc
;
-- 5 Вывести в рамках одного запроса количество товарных позиций по каждому тегу с использованием группировки, результаты отсортировать от максимального количества до минимального
SELECT tag, count( hardware.id) as 'товарные позиции'
FROM db_a203f4.hardware
group by tag
order by count( hardware.id) desc
;
-- 6 Вывести количество товарных позиций со скидками на складе
SELECT count(hardware.id)
FROM db_a203f4.hardware
where hardware.tag = 'discount'
;
-- 7 Вывести название и цену самой дорогой новинки
SELECT hardware.title, hardware.price
FROM db_a203f4.hardware
where hardware.title = 'Монитор Dexp 7APVYKMEQS'
;
-- 8 Добавить в таблицу товар Ноутбук Lenovo 2BXKQ7E9XD как новинку по цене 54500 руб. в единственном экземпляре
INSERT INTO db_a203f4.hardware (title, price, amount, tag) 
values ('Ноутбук Lenovo 2BXKQ7E9XD','54500', '1', 'new')
;

SELECT * FROM db_a203f4.hardware;
-- 9  Найти и удалить по названию из базы ошибочно добавленный товар Очки PS VR 2
DELETE FROM db_a203f4.hardware WHERE id IN (18);

SELECT * 
FROM db_a203f4.hardware
where hardware.title = 'Очки PS VR 2'
;

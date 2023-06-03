/*/
https://drive.google.com/file/d/1PQn576YVakvlWrIgIjSP9YEf5id4cqYs/view?usp=sharing

Задание №1. 
Вывести на экран, сколько машин каждого цвета для машин марок BMW и LADA

Задание №2. 
Вывести на экран марку авто(количество) и количество авто не этой марки.
100 машин, их них 20 - BMW и 80 машин другой марки , AUDI - 30 и 70 машин другой 
марки, LADA - 15, 85 авто другой марки

Задание №3.
Даны 2 таблицы, созданные следующим образом:
create table test_a (id INT, test varchar(10));
create table test_b (id INT);
insert into test_a(id, test) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);
Напишите запрос, который вернет строки из таблицы test_a, id которых нет в 
таблице test_b, НЕ используя ключевого слова NOT.

Дополнительно задание: (Не влияет на баллы дз)
Вернёмся к домашней работе #3 и заметим, что таблица orders была неудачно спроектирована. 
Записи odate были заданы типом VARCHAR и в них долгое время помещались значения в формате '10/03/1990'.
Необходимо преобразовать поля таблицы к типу DATETIME, сохранив введеные ранее значения.
/*/

USE homework_04;
/*/ Задание №1. 
Вывести на экран, сколько машин каждого цвета для машин марок BMW и LADA /*/

DROP TABLE IF EXISTS AUTO;
CREATE TABLE IF NOT EXISTS AUTO  
(       
	REGNUM VARCHAR(10) PRIMARY KEY, 
	MARK VARCHAR(10), 
	COLOR VARCHAR(15),
	RELEASEDT DATE, 
	PHONENUM VARCHAR(15)
);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111114,'LADA', 'КРАСНЫЙ', date'2008-01-01', '9152222221');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111115,'VOLVO', 'КРАСНЫЙ', date'2013-01-01', '9173333334');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111116,'BMW', 'СИНИЙ', date'2015-01-01', '9173333334');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111121,'AUDI', 'СИНИЙ', date'2009-01-01', '9173333332');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111122,'AUDI', 'СИНИЙ', date'2011-01-01', '9213333336');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111113,'BMW', 'ЗЕЛЕНЫЙ', date'2007-01-01', '9214444444');
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111126,'LADA', 'ЗЕЛЕНЫЙ', date'2005-01-01', null);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111117,'BMW', 'СИНИЙ', date'2005-01-01', null);
INSERT INTO AUTO (REGNUM, MARK,	COLOR, RELEASEDT, PHONENUM )
VALUES(111119,'LADA', 'СИНИЙ', date'2017-01-01', 9213333331);

/*/ 
Задание №1. 
Вывести на экран, сколько машин каждого цвета для машин марок BMW и LADA 
/*/

SELECT MARK, COLOR, COUNT(*) AS count
FROM AUTO
WHERE MARK = 'BMW' OR MARK = 'LADA'
GROUP BY MARK, COLOR
ORDER BY MARK;

/*/
Задание №2. 
Вывести на экран марку авто(количество) и количество авто не этой марки.
100 машин, их них 20 - BMW и 80 машин другой марки , AUDI - 30 и 70 машин другой 
марки, LADA - 15, 85 авто другой марки
/*/

SELECT 	MARK, 
		COUNT(*) AS count,
        (SELECT COUNT(*) FROM AUTO) - COUNT(*) AS others
FROM AUTO
GROUP BY MARK;

/*/
Задание №3.
Даны 2 таблицы, созданные следующим образом:
/*/

DROP TABLE IF EXISTS test_a;
DROP TABLE IF EXISTS test_b;

create table IF NOT EXISTS test_a (id INT, test varchar(10));
create table IF NOT EXISTS test_b (id INT);
insert into test_a(id, test) values
(10, 'A'),
(20, 'A'),
(30, 'F'),
(40, 'D'),
(50, 'C');
insert into test_b(id) values
(10),
(30),
(50);

/*/
Напишите запрос, который вернет строки из таблицы test_a, id которых нет в 
таблице test_b, НЕ используя ключевого слова NOT.
/*/

SELECT test_a.id, test_a.test  
FROM test_a
LEFT JOIN test_b ON test_a.id = test_b.id
WHERE test_b.id IS NULL;

/*/
Дополнительно задание: (Не влияет на баллы дз)
Вернёмся к домашней работе #3 и заметим, что таблица orders была неудачно спроектирована. 
Записи odate были заданы типом VARCHAR и в них долгое время помещались значения в формате '10/03/1990'.
Необходимо преобразовать поля таблицы к типу DATETIME, сохранив введеные ранее значения.
/*/
DROP TABLE IF EXISTS orders ;
CREATE TABLE IF NOT EXISTS orders (
onum INT NOT NULL,
amt DECIMAL(7,2) NOT NULL,
odate VARCHAR(10) NOT NULL,
cnum INT,
snum INT,
PRIMARY KEY (onum)
);
INSERT INTO orders(onum, amt, odate, cnum, snum)
VALUES
(3001, 18.69, '10/03/1990', 2008, 1007),
(3003, 767.19, '10/03/1990', 2001, 1001),
(3002, 1900.10, '10/03/1990', 2007, 1004),
(3005, 5160.45, '10/03/1990', 2003, 1002),
(3006, 1098.16, '10/03/1990', 2008, 1007),
(3009, 1713.23, '10/04/1990', 2002, 1003),
(3007, 75.75, '10/04/1990', 2004, 1002),
(3008, 4723.00, '10/05/1990', 2006, 1001),
(3010, 1309.95, '10/06/1990', 2004, 1002),
(3011, 9891.88, '10/06/1990', 2006, 1001);

ALTER TABLE orders ADD COLUMN ndate DATETIME;
UPDATE orders SET ndate = STR_TO_DATE(odate, '%d/%m/%Y');
ALTER TABLE orders DROP COLUMN odate;
ALTER TABLE orders CHANGE COLUMN ndate odate DATETIME;



use homework_03;
/*/
1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке:
 city, sname, snum, comm. (к первой или второй таблице, используя SELECT)
2.	 Напишите команду SELECT, которая вывела бы оценку(rating),
 сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)
3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов
 без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)
4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G.
 Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000.
 (“Заказы”, “amt”  - сумма)
6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)
7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков,
 у которых рейтинг больше 100 и они находятся не в Риме.
/*/

DROP TABLE IF EXISTS salespeople;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS orders;

-- TABLE_1 SALESPEOPLE ---------------------------
CREATE TABLE IF NOT EXISTS salespeople (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    snum INT NOT NULL,
    sname VARCHAR(25) NOT NULL,
    city VARCHAR(25),
    comm DECIMAL(3,2)
);
INSERT INTO salespeople (snum, sname, city, comm) VALUES
	(1001, "Peel", "London", 0.12),
	(1002, "Serres", "San Jose", 0.13),
	(1004, "Motika", "London", 0.11),
	(1007, "Rifkin", "Barcelona", 0.15),
	(1003, "Axelrod", "New York", 0.10);

-- TABLE_2 CUSTOMERS -------------------------------
CREATE TABLE IF NOT EXISTS customers (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    cnum INT NOT NULL,
    cname VARCHAR(25) NOT NULL,
    city VARCHAR(25),
    rating INT,
    snum INT
);
INSERT INTO customers(cnum, cname, city, rating, snum) VALUES
	(2001, "Hoffman", "London", 100, 1001),
	(2002, "Giovanni", "Rome", 200, 1003),
	(2003, "Liu", "SanJose", 200, 1002),
	(2004, "Grass", "Berlin", 300, 1002),
	(2006, "Clemens", "London", 100, 1001),
	(2008, "Cisneros", "SanJose", 300, 1007),
	(2007, "Pereira", "Rome", 100, 1004);

-- TABLE_3 ORDERS -----------------------------------
CREATE TABLE IF NOT EXISTS orders (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    onum INT NOT NULL,
    amt DECIMAL(6,2),
    odate DATE,
    cnum INT NOT NULL,
    snum INT NOT NULL
);
INSERT INTO orders(onum, amt, odate, cnum, snum) VALUES
	(3001, 18.69, '1990-03-10', 2008, 1007),
	(3003, 767.19, '1990-03-10', 2001, 1001),
	(3002, 1900.10, '1990-03-10', 2007, 1004),
	(3005, 5160.45, '1990-03-10', 2003, 1002),
	(3006, 1098.16, '1990-03-10', 2008, 1007),
	(3009, 1713.23, '1990-04-10', 2002, 1003),
	(3007, 75.75, '1990-04-10', 2004, 1002),
	(3008, 4723.00, '1990-05-10', 2006, 1001),
	(3010, 1309.95, '1990-06-10', 2004, 1002),
	(3011, 9891.88, '1990-06-10', 2006, 1001);
    
/* 1.	 Напишите запрос, который вывел бы таблицу со столбцами в следующем порядке:
 city, sname, snum, comm. (к первой или второй таблице, используя SELECT)*/
 
 SELECT city, sname, snum, comm
 FROM salespeople;

/* 2.	 Напишите команду SELECT, которая вывела бы оценку(rating),
 сопровождаемую именем каждого заказчика в городе San Jose. (“заказчики”)*/
 
  SELECT rating, cname
  FROM customers
  WHERE city = 'SanJose';

/*3.	 Напишите запрос, который вывел бы значения snum всех продавцов из таблицы заказов
 без каких бы то ни было повторений. (уникальные значения в  “snum“ “Продавцы”)*/
 
 SELECT DISTINCT snum 
 FROM orders;
 
/*/ 4*. 	Напишите запрос, который бы выбирал заказчиков, чьи имена начинаются с буквы G.
 Используется оператор "LIKE": (“заказчики”) https://dev.mysql.com/doc/refman/8.0/en/string-comparison-functions.html
/*/

SELECT * FROM customers 
WHERE cname LIKE 'G%';

/*/ 5. 	Напишите запрос, который может дать вам все заказы со значениями суммы выше чем $1,000.
 (“Заказы”, “amt”  - сумма)/*/
 
SELECT * FROM orders
WHERE amt > 1000;
    
/*/ 6.	Напишите запрос который выбрал бы наименьшую сумму заказа.
 (Из поля “amt” - сумма в таблице “Заказы” выбрать наименьшее значение)/*/
 
SELECT MIN(amt) FROM orders;
 
/*/ 7. 	Напишите запрос к таблице “Заказчики”, который может показать всех заказчиков,
 у которых рейтинг больше 100 и они находятся не в Риме./*/
 
SELECT * FROM customers
WHERE city != 'Rome' && rating > 100;
 
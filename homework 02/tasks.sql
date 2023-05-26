/*
	1. Используя операторы языка SQL,создайте таблицу “sales”. Заполните ее данными.
*/
CREATE DATABASE IF NOT EXISTS homework_02; 	-- Создание БД, если она не была создана
USE homework_02;							-- Используем БД  homework_02
DROP TABLE IF EXISTS sales; 				-- удалим таблицу если существует
CREATE TABLE IF NOT EXISTS sales 			-- создадим таблицу если не существует
( 
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT, 
  oder_date DATE UNIQUE NOT NULL,
  count_product INT UNSIGNED NOT NULL DEFAULT 0
);
INSERT INTO sales (oder_date, count_product)
VALUES
('2023-01-01',150),
('2023-01-02',180),
('2023-01-03',20),
('2023-01-04',120),
('2023-01-05',340);
/*
	2. Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва :
	меньше 100 - Маленький заказ
	от 100 до 300 - Средний заказ
	больше 300 - Большой заказ
*/
SELECT
	id AS 'ИД',
	CASE
	WHEN count_product < 100 
		THEN 'Маленький заказ'
	WHEN count_product between 100 AND 300
		THEN 'Средний заказ'
	WHEN count_product > 300 
		THEN 'Большой заказ'
	ELSE 'Не определено'
	END AS 'Тип заказа'
FROM sales;
/*
	3. Создайте таблицу “orders”, заполните ее значениями*
    Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
	OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»
*/

DROP TABLE IF EXISTS oders; 				
CREATE TABLE IF NOT EXISTS oders 			
( 
  id INT UNSIGNED PRIMARY KEY NOT NULL AUTO_INCREMENT,
  employee_id VARCHAR(40) NOT NULL,
  amount DECIMAL,
  order_status VARCHAR(10)
);
INSERT INTO oders (employee_id, amount,order_status)
VALUES
("e03", 15.00, "OPEN"),
("e01", 25.50, "OPEN"),
("e05", 100.70, "CLOSED"),
("e02", 22.18, "OPEN"),
("e04", 9.50, "CANCELLED");
SELECT employee_id, amount,
CASE order_status
	WHEN  "OPEN"
		THEN "Order is in open state"
	WHEN "CLOSED"
		THEN "Order is closed"
	WHEN "CANCELLED"
		THEN "Order is cancelled"
	ELSE 'Не определено' 
    END AS full_order_status
FROM oders;

/*
4. Чем NULL отличается от 0?
0 - это число ноль, то есть известное конкретное значение. 
Оно может быть использовано в качестве дефолтного значения для числовых переменных.
0 может также использоваться для обозначения некоторых условий, например, "false".
0  может использоваться в арифметических операциях.

NULL - это специальное значение в SQL, которое обозначает отсутствие или неопределенность значения.
В строке данных, где содержится NULL, можно сказать, что значение отсутствует или неизвестно. 
NULL не является числом или строкой и не может использоваться в арифметических операциях.
*/

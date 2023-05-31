/*/
Отсортируйте поле “зарплата” в порядке убывания и возрастания
** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой
 (возможен подзапрос)
Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000
/*/

use homework_03;

DROP TABLE IF EXISTS employee;
CREATE TABLE IF NOT EXISTS employee (
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(25) NOT NULL,
    surname VARCHAR(25) NOT NULL,
    specialty  VARCHAR(25) NOT NULL,
    seniority INT,
    salary INT,
    аgе INT
);
INSERT INTO employee (firstname, surname, specialty, seniority, salary, аgе) VALUES
	('Вася', 'Васькин', 'начальник', 40, 100000, 60),
	('Петя', 'Петькин', 'начальник', 8, 70000, 30),
	('Катя', 'Каткина', 'инженер', 2, 70000, 25),
	('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
	('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
	('Петр', 'Петров', 'рабочий', 20, 25000, 40),
	('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
	('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
	('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
	('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
	('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
	('Люся', 'Люськина', 'уборщик', 10, 10000, 49);

/* 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания	*/

SELECT salary 
FROM employee 
ORDER BY salary DESC;

SELECT salary 
FROM employee 
ORDER BY salary;

/*/
2. ** Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с
наибольшей заработной платой (возможен подзапрос)
/*/	

SELECT * FROM 
(
    SELECT * FROM employee 
    ORDER BY salary DESC 
    LIMIT 5
) 
AS t
ORDER BY salary ASC;
 
/*/
3. Выполните группировку всех сотрудников по специальности,
суммарная зарплата которых превышает 100000
/*/

SELECT specialty, SUM(salary) 
FROM employee
GROUP BY specialty
HAVING SUM(salary) > 100000;
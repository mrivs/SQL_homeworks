/*/
1. Создайте функцию, которая принимает кол-во сек и
формат их в кол-во дней, часов, минут и секунд.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
2. Выведите только четные числа от 1 до 10 (Через цикл).
Пример: 2,4,6,8,10
/*/

CREATE DATABASE IF NOT EXISTS homework_06;
USE homework_06;

/*/
1. Создайте функцию, которая принимает кол-во сек и
формат их в кол-во дней, часов, минут и секунд.
/*/
DROP FUNCTION IF EXISTS format_s;
DELIMITER //
CREATE FUNCTION format_s ( seconds INT) RETURNS TEXT 
DETERMINISTIC
BEGIN
  DECLARE str TEXT DEFAULT "";
  DECLARE sec, min, hours, days INT;
  SET days = (seconds - seconds % (24*3600))/(24*3600);
  SET hours = (seconds % (24*3600) - seconds % (60*60))/(60*60);
  SET min = (seconds % (24*60) - seconds % (60))/60;
  SET sec = seconds % 60;
  SET str= CONCAT(days," days ", hours ," hours ", min, " minutes ", sec, " seconds");
  RETURN (str);
END //
DELIMITER ;

SET @var=123456;
SELECT format_s (@var) as result;

/*/
2. Выведите только четные числа от 1 до 10 (Через цикл).
/*/
DROP PROCEDURE IF EXISTS even_numbers;
DELIMITER //
CREATE PROCEDURE even_numbers(n INT)
BEGIN
    DECLARE i INT DEFAULT 2;
    DROP TEMPORARY TABLE IF EXISTS temp_n;
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_n (numbers INT);
    WHILE i <= n DO
        INSERT INTO temp_n VALUES (i);
        SET i = i + 2;
    END WHILE;
    SELECT * FROM temp_n;
END //
DELIMITER ;

CALL even_numbers(10);





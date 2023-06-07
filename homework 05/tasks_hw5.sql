/*/
Файл:
https://docs.google.com/spreadsheets/d/1bKCfz2tMENAIS
BxU7XRevge1qraNuPoN/edit?usp=share_link&ouid=11263
1188905352530754&rtpof=true&sd=true

Скрипт:
https://drive.google.com/file/d/1rkNr6GHSE9ulRs39BB4RC
80aKMg1c7Jw/view?usp=share_link

1. Создайте представление, в которое попадут
автомобили стоимостью до 25 000 долларов
2. Изменить в существующем представлении порог
для стоимости: пусть цена будет до 30 000 долларов
(используя оператор ALTER VIEW)
3. Создайте представление, в котором будут только
автомобили марки “Шкода” и “Ауди”

4. Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, мы 
вычитаем время станций для пар смежных станций. Мы можем вычислить это значение без использования 
оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции 
LEAD . Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить 
результат. В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу 
после нее.

/*/
USE homework_05;

DROP TABLE IF EXISTS 	cars;
DROP TABLE IF EXISTS 	train_schedule;
CREATE TABLE IF NOT EXISTS cars
(
	id INT NOT NULL PRIMARY KEY,
    mark VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
CREATE TABLE IF NOT EXISTS train_schedule
(
	train_id INT NOT NULL,
    station VARCHAR(20),
    station_time TIME
);

INSERT train_schedule
VALUES
	(110, "San Francisco", "10:00:00"),
    (110, "Redwood", "10:54:00" ),
    (110, "Palo Alto", "11:02:00" ),
    (110, "San Jose", "12:35:00"),
	(120, "San Francisco", "11:00:00"),
    (120, "Palo Alto", "12:49:00" ), 
    (120, "San Jose", "13:30:00");
  
/*/
1. Создайте представление, в которое попадут
автомобили стоимостью до 25 000 долларов
/*/  
DROP VIEW IF EXISTS cheap_cars;
CREATE VIEW  cheap_cars  AS
  SELECT * FROM cars
  WHERE cost < 25000;

/*/
2. Изменить в существующем представлении порог
для стоимости: пусть цена будет до 30 000 долларов
(используя оператор ALTER VIEW)
/*/  
ALTER VIEW cheap_cars AS
  SELECT * FROM cars
  WHERE cost < 30000;
  
/*/
3. Создайте представление, в котором будут только
автомобили марки “Шкода” и “Ауди”
/*/
DROP VIEW IF EXISTS some_cars;
CREATE VIEW  some_cars  AS
  SELECT * FROM cars
  WHERE mark IN ("Skoda","Audi");

/*/
4. Добавьте новый столбец под названием «время до следующей станции». Чтобы получить это значение, мы 
вычитаем время станций для пар смежных станций. Мы можем вычислить это значение без использования 
оконной функции SQL, но это может быть очень сложно. Проще это сделать с помощью оконной функции 
LEAD. Эта функция сравнивает значения из одной строки со следующей строкой, чтобы получить 
результат. В этом случае функция сравнивает значения в столбце «время» для станции со станцией сразу 
после нее.
/*/
SELECT *, 
TIMEDIFF(
  LEAD (station_time,1) OVER (PARTITION BY train_id),
  station_time
  )
 AS time_to_next_station
FROM train_schedule;




    

-- 1. Создайте представление, которое для каждого курса выводит название, номер последнего
-- потока, дату начала обучения последнего потока и среднюю успеваемость курса по всем потокам.
-- 2. Удалите из базы данных всю информацию, которая относится к преподавателю с
-- идентификатором, равным 3. Используйте транзакцию.
-- 3. Создайте триггер для таблицы успеваемости, который проверяет значение успеваемости на
-- соответствие диапазону чисел от 0 до 5 включительно.
-- 4. Дополнительное задание. Создайте триггер для таблицы потоков, который проверяет, что
-- дата начала потока больше текущей даты, а номер потока имеет наибольшее значение среди
-- существующих номеров. При невыполнении условий необходимо вызвать ошибку с информативным сообщением.



CREATE VIEW course_info AS
SELECT
courses.name AS course_name,
streams.number AS stream_number,  --'poslednii_potok',
  --'started_at poslednii_potok',
AVG(performance) AS grade--kursa

FROM courses


LEFT JOIN grades
ON students.id = grades.student_id
LEFT JOIN streams
ON grades.stream_id = streams.id
LEFT JOIN courses
ON streams.course_id = courses.id;


.mode column
SELECT
courses.name AS course_name,
streams.number AS stream,
'vlozhennyi' AS last_stream,
AVG(performance) AS avg
FROM streams
LEFT JOIN grades
ON streams.id = grades.stream_id
LEFT JOIN courses
ON streams.course_id = courses.id
GROUP BY streams.course_id;



SELECT started_at FROM streams ORDER BY SUBSTR(started_at, 4, 2) DESC;

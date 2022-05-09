-- 1. Выполнено. Представление в локальной версии БД оставил.
-- 2. Выполнено. Вообще по-хорошему нужно было удалять и наименование курса, но для работы транзакции пойдёт :)

-- 3. Создайте триггер для таблицы успеваемости, который проверяет значение успеваемости на
-- соответствие диапазону чисел от 0 до 5 включительно.
-- 4. Дополнительное задание. Создайте триггер для таблицы потоков, который проверяет, что
-- дата начала потока больше текущей даты, а номер потока имеет наибольшее значение среди
-- существующих номеров. При невыполнении условий необходимо вызвать ошибку с информативным сообщением.
CREATE VIEW course_info AS
  SELECT
    courses.name AS course_name,
    MAX(number) AS stream,
    MAX(started_at) AS last_stream,
    AVG(performance) AS avg
  FROM streams
    LEFT JOIN grades
      ON streams.id = grades.stream_id
    LEFT JOIN courses
      ON streams.course_id = courses.id
  GROUP BY streams.course_id;
SELECT * FROM course_info;

BEGIN TRANSACTION;
DELETE FROM grades WHERE teacher_id = 3;
DELETE FROM teachers WHERE id = 3;
COMMIT;
SELECT * FROM teachers;

-- 1. Выполнено. Представление в локальной версии БД оставил.
-- 2. Выполнено. Вообще по-хорошему нужно было удалять и наименование курса, но для работы транзакции пойдёт :)
-- 3. Выполнено. Сначала подумал, что нужна проверка ещё и типа числа, но такой триггер справляется :)

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

CREATE TRIGGER check_performance BEFORE INSERT
ON grades
BEGIN
  SELECT CASE
  WHEN
    NEW.performance NOT BETWEEN 0 AND 5
  THEN
    RAISE(ABORT, 'Enter a number from 0 to 5')
  END;
END;
INSERT INTO grades (teacher_id , stream_id, performance) VALUES (3, 1, 8);
INSERT INTO grades (teacher_id , stream_id, performance) VALUES (3, 1, 'Справляется');

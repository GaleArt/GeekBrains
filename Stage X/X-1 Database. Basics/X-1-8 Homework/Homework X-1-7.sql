-- 1. Выполнено. Представление в локальной версии БД оставил.
-- 2. Выполнено. Вообще по-хорошему нужно было удалять и наименование курса, но для работы транзакции пойдёт :)
-- 3. Выполнено. Сначала подумал, что нужна проверка ещё и типа числа, но такой триггер справляется :)
-- 4. Чтобы не городить огород решил не усложнять логику New.started_at. Поэтому потом в INSERT число такого формата.
-- Плюс нужно будет перегнать формат в БД, но думаю для демонстрации работы достаточно :)
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

CREATE TRIGGER check_date BEFORE INSERT
ON streams
BEGIN
  SELECT CASE
  WHEN
    (New.number <= (SELECT number FROM streams ORDER BY id DESC LIMIT 1))
    OR (New.started_at <=
        (SELECT
          MAX(SUBSTR(started_at, 7, 4) || '-' ||
          SUBSTR(started_at, 4, 2) || '-' ||
          SUBSTR(started_at, 1, 2))
        FROM streams))
  THEN
    RAISE(ABORT, 'Wrong date or stream_number!')
  END;
END;

INSERT INTO streams (number) VALUES (3);
INSERT INTO streams (started_at) VALUES (2011-11-11);
INSERT INTO streams (id, course_id, number, started_at, students_amount, finished_at)
VALUES (5, 3, 345, '2022-05-11', 29, '2022-05-21');

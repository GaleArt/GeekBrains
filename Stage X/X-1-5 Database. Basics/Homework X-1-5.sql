-- 1. Найдите потоки, количество учеников в которых больше или равно 40.
-- В отчет выведите номер потока, название курса и количество учеников.
SELECT
  number,
  (SELECT name FROM courses WHERE id = course_id) AS course_name,
  students_amount
FROM streams WHERE students_amount >= 40;
-- 2. Найдите два потока с самыми низкими значениями успеваемости.
-- В отчет выведите номер потока, название курса, фамилию и имя преподавателя (одним столбцом), оценку успеваемости.
.mode column
SELECT
  (SELECT number FROM streams WHERE id = stream_id) AS stream,
  (SELECT name FROM courses WHERE id =
    (SELECT course_id FROM streams WHERE id = stream_id)
      ) AS course,
  (SELECT SUBSTR(name, 1, 20) || ' ' || SUBSTR(surname, 1, 20) FROM teachers WHERE id = teacher_id) AS teacher,
  performance
FROM grades ORDER BY performance ASC LIMIT 2;
-- 3. Найдите среднюю успеваемость всех потоков преподавателя Николая Савельева.
-- В отчёт выведите идентификатор преподавателя и среднюю оценку по потокам.
.mode column
SELECT
  teacher_id AS teacher,
  AVG(performance) AS grade
FROM grades
  WHERE grades.teacher_id =
    (SELECT id FROM teachers WHERE name = 'Николай' AND surname = 'Савельев' );
-- 4. Найдите потоки преподавателя Натальи Петровой, а также потоки,по которым успеваемость ниже 4.8.
-- В отчёт выведите идентификатор потока, фамилию и имя преподавателя.
-- В отчёте должно быть 3 столбца - номер потока, фамилия преподавателя, имя преподавателя.
.mode column
SELECT
  (SELECT course_id FROM streams WHERE id = (SELECT stream_id FROM grades WHERE id = teacher_id)) AS course,
  surname,
  name
FROM teachers WHERE name = 'Наталья' AND surname = 'Петрова'
UNION
SELECT
  (SELECT id FROM courses WHERE id = (SELECT course_id FROM streams WHERE id = stream_id)) AS course,
  (SELECT surname FROM teachers WHERE id = teacher_id) AS surname,
  (SELECT name FROM teachers WHERE id = teacher_id) AS name
FROM grades WHERE performance < 4.8;
-- 5. Дополнительное задание. Найдите разницу между средней успеваемостью преподавателя с наивысшим соответствующим значением
-- и средней успеваемостью преподавателя с наименьшим значением. Средняя успеваемость считается по всем потокам преподавателя.
SELECT
  MAX(grade) - MIN(grade) AS Difference
FROM
  (SELECT teacher_id, AVG(performance) AS grade
FROM grades
GROUP BY teacher_id);

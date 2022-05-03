-- 1. Найдите потоки, количество учеников в которых больше или равно 40.
-- В отчет выведите номер потока, название курса и количество учеников.
SELECT
  number,
  (SELECT name FROM courses WHERE id = course_id) AS course_name,
  students_amount
FROM streams WHERE students_amount >= 40;
-- 2. Найдите два потока с самыми низкими значениями успеваемости.
-- В отчет выведите номер потока, название курса, фамилию
-- и имя преподавателя (одним столбцом), оценку успеваемости.

SELECT
  'student_surname',
  'student_name',
  'course_name',
  grade
FROM grades;

-- 3. Найдите среднюю успеваемость всех потоков преподавателя Николая Савельева.
-- В отчёт выведите идентификатор преподавателя и среднюю оценку по потокам.

-- 4. Найдите потоки преподавателя Натальи Петровой, а также потоки,
-- по которым успеваемость ниже 4.8.
-- В отчёт выведите идентификатор потока, фамилию и имя преподавателя.
-- В отчёте должно быть 3 столбца - номер потока, фамилия преподавателя,
-- имя преподавателя.

-- 5. Дополнительное задание. Найдите разницу между средней успеваемостью
-- преподавателя с наивысшим соответствующим значением
-- и средней успеваемостью преподавателя с наименьшим значением.
-- Средняя успеваемость считается по всем потокам преподавателя.

-- Работаем с базой данных учителей teachers.db. Для каждого из заданий требуется создать запрос,
-- сдать надо только код запросов в текстовом файле. Для решений воспользуйтесь объединением
-- JOIN, не используйте вложенные запросы и объединение UNION.
-- 1. Покажите информацию по потокам. В отчет выведите номер потока, название курса и дату начала занятий.
-- 2. Найдите общее количество учеников для каждого курса. В отчёт выведите название курса и количество учеников по всем потокам курса.


.mode column
SELECT
streams.number AS stream,
courses.name AS course,
streams.started_at AS started
FROM streams
JOIN courses
ON streams.course_id = courses.id;

.mode column
SELECT
courses.name AS course,
SUM(streams.students_amount) AS students
FROM streams
JOIN courses
ON streams.course_id = courses.id GROUP BY courses.id;
-- 3. Для всех учителей найдите среднюю оценку по всем проведённым потокам. В отчёт выведите идентификатор,
-- фамилию и имя учителя, среднюю оценку по всем проведенным потокам. Важно чтобы учителя, у которых не было потоков, также попали в выборку.

-- 4. Дополнительное задание. Для каждого преподавателя выведите имя, фамилию, минимальное значение успеваемости по всем потокам преподавателя,
-- название курса, который соответствует потоку с минимальным значением успеваемости, максимальное значение успеваемости по всем потокам
-- преподавателя, название курса, соответствующий потоку с максимальным значением успеваемости. В дополнительном задании допускается
-- применение вложенных запросов.

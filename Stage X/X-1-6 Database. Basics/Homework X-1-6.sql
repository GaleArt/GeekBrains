-- 1. Выполнено.
-- 2. Пришлось повыдумывать, но вроде благодаря группировке работает.
-- 3. Для этого задания использовался метод LEFT JOIN (исходя из задания), хотя разницы с JOIN не будет, т.к. все данные в таблице заполнены.
-- 4. Дополнительное задание. Для каждого преподавателя выведите имя, фамилию, минимальное значение успеваемости по всем потокам преподавателя,
-- название курса, который соответствует потоку с минимальным значением успеваемости, максимальное значение успеваемости по всем потокам
-- преподавателя, название курса, соответствующий потоку с максимальным значением успеваемости. В дополнительном задании допускается
-- применение вложенных запросов.
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

.mode column
SELECT
teacher_id AS teacher,
surname,
name,
AVG(performance) AS grade
FROM teachers
LEFT JOIN grades
ON teachers.id = grades.teacher_id GROUP BY grades.teacher_id;

.mode column
SELECT
  teachers.name,
  teachers.surname,
  MIN(performance),
  courses.name AS course_min,
  MAX(performance),
  courses.name AS course_max
FROM teachers
  LEFT JOIN grades
    ON teachers.id = grades.teacher_id GROUP BY grades.teacher_id
  LEFT JOIN streams
    ON grades.stream_id = streams.id
  LEFT JOIN courses
    ON streams.course_id = courses.id;

-- 1. Выполнено.
-- 2. Пришлось повыдумывать, но вроде благодаря группировке работает.
-- 3. Для этого задания использовался метод LEFT JOIN (исходя из задания), хотя разницы с JOIN не будет, т.к. все данные в таблице заполнены.
-- 4. Дополнительное задание. Попробовал несколько вложенных запросов, не пошло :(. Времени осталось мало, поэтому не доделывал.
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
  teacher_id AS teacher,
  teachers.surname,
  teachers.name,
  MIN(performance) AS min_grade,
  'xz' AS min_course,
  MAX(performance) AS max_grade,
  'xz' AS max_course
FROM teachers
  LEFT JOIN grades
    ON teachers.id = grades.teacher_id
  LEFT JOIN streams
    ON grades.stream_id = streams.id
  LEFT JOIN courses
    ON streams.course_id
GROUP BY grades.teacher_id;

-- 1. Выполнено. Оставил еще количество потоков чтобы легче было проверять.
-- 2. Добавил нового учителя, который еще не провел ни одного занятия для проверки.
-- Немного не понял проблему: если написать как в методичке, т.е.
-- WINDOW w_teachers AS (PARTITION BY teachers.id) перед сортировкой и сделать ссылку в OVER, то средний считается по всем учителям
-- 3.
-- 4. Скриншот в архиве. Я и до этого пользовался чем-то подобным: "DB Browser (SQLite)" https://sqlitebrowser.org/
-- 5. Дополнительное задание не делал, не успеваю блин :(
SELECT DISTINCT
  courses.name AS course_name,
  COUNT(courses.id) OVER(PARTITION BY streams.course_id) AS amount,
  SUM(number) OVER(PARTITION BY courses.id) AS students
  FROM streams
    LEFT JOIN courses
      ON streams.course_id = courses.id
  ORDER BY courses.id;

SELECT DISTINCT
  teachers.id,
  teachers.surname,
  teachers.name,
  AVG(performance) OVER(PARTITION BY teachers.id) AS GPA
  FROM teachers
    LEFT JOIN grades
      ON grades.teacher_id = teachers.id
  ORDER BY teachers.surname, teachers.name;

-- 3. Какие индексы надо создать для максимально быстрого выполнения представленного запроса?
--
-- SELECT
-- surname,
-- name,
-- number,
-- performance
-- FROM academic_performance
-- JOIN teachers
-- ON academic_performance.teacher_id = teachers.id
-- JOIN streams
-- ON academic_performance.stream_id = streams.id
-- WHERE number >= 200;

/*
      ЗАДАНИЕ №1.2
ДОПОЛНИТЕЛЬНО:
Написать программу, которая рисует смайлик (один чёрный круг, и два
белых круга поверх чёрного — глаза, дополнительно можно нарисовать зрачки).
*/

let size = prompt('Размер смайлика');
// тушка:
drawCircle(size, size, size, 'black');
drawCircle(size, size, size * 0.99, 'greenyellow');
// глаза:
drawCircle(size * 0.5, size * 0.7, size / 3.9, 'black');
drawCircle(size * 0.5, size * 0.7, size / 4, 'white');
drawCircle(size * 1.5, size * 0.7, size / 3.9, 'black');
drawCircle(size * 1.5, size * 0.7, size / 4, 'white');
// зрачки:
drawCircle(size * 0.5, size * 0.7, size / 10, 'black');
drawCircle(size * 1.5, size * 0.7, size / 10, 'black');
// рот:
drawCircle(size * 1.1, size * 1.4, size / 9, 'black');

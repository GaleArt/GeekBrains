/*
      ЗАДАНИЕ №4.2.
ДОПОЛНИТЕЛЬНО:
Вынесите алгоритм рисования сетки для игры в «Крестики-нолики» из прошлого
домашнего задания в отдельную функцию и нарисуйте такой узор:
УЗОЛ В МЕТОДИЧКЕ    */
let size = prompt('Выберите размер одной клетки (в пикселях)');
function crossZero (left, top, size) {
  for (let calc = 1; calc < 3; calc = calc + 1) {
      drawRect(left, top + calc * size / 3, size, 0.7, 'mediumpurple');
      drawRect(top + calc * size / 3, left, 0.7, size, 'green');
    }
}
crossZero(100, 100, size);
crossZero(100 + (size / 6), 100 + (size / 6), size / 1.5);
crossZero(100 + (size / 3), 100 + (size / 3), size / 3);

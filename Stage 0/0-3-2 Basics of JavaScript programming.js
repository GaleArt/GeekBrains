/*
      ЗАДАНИЕ №3.2.
ДОПОЛНИТЕЛЬНО:
Написать программу, которая рисует доску для игры «Крестики-нолики».
*/
let size = prompt('Выберите размер одной клетки (в пикселях)');
let element = prompt('Количество клеток поля в одной строке');
let color = 'mediumpurple';

for (let y = 1; y <= element; y = y + 1) {
  for (let x = 1; x <= element; x = x + 1) {
    drawRect(x * size, 0, 5, size * element, color);
  }
drawRect(0, y * size, size * element, 5, color);
}

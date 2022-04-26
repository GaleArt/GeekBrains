/*
      ЗАДАНИЕ №5
      ДОМАШНЕЕ ЗАДАНИЕ:
Реализуйте калькулятор общей стоимости покупок: пользователь вводит суммы
покупок из чека через запятую, а программа выдаёт результат «Сумма ваших
покупок n рублей». Вынесите алгоритм рисования графика изменения цены из
урока в отдельную функцию, принимающую следующие аргументы:
● prices — массив с ценами;
● height — высота графика (чтобы вместо фиксированных 200 можно было
указать любую высоту).
      ДОПОЛНИТЕЛЬНО
Усовершенствуйте функцию рисования графика, добавив в неё ещё один аргумент:
● width — ширина графика, чтобы шаг по оси X не был фиксированным (сейчас
это 10), а вычислялся по формуле [количество дней] / [ширина графика];
Нарисуйте сетку под графиком, чтобы его удобнее было читать. Для рисования
сетки в функцию drawLine можно в качестве аргумента color передавать 'gray'
или любой другой, например сгенерированный с помощью сервиса
https://www.w3schools.com/colors/colors_picker.asp.   */

// Просим пользователя ввести все цены из чека:
let prices = prompt('Введите цена из чека через запятую');
let array = prices.split(',');
let sum = 0;
  for (let i = 0; i < array.length; i++) {
    sum += +array[i];
  }
console.log('Сумма всех покупок: ' + sum + ' руб.');
// Вспомогательно:
let maxPrice = array[0];
for (let i = 1; i < array.length; i = i + 1) {
  if (array[i] > maxPrice) {
    maxPrice = +array[i];
	}
}
// функция heigth для отображения графика + ДОПОЛНИТЕЛЬНО:
let height = maxPrice + 20;
console.log('Параметр высоты:' +  height);	// на 20 больше макс значения
let width = height * 2 / array.length;
console.log('Параметр ширины:' +  width);	// 2 высоты на кол-во элементов

console.log(width);
for (let i = 1; i < array.length; i = i + 1) {
	drawLine(		                // ВНИМАНИЕ! функция только для GeekBrains!
      i * width,		          // ежедневный прирост
      height - array[i - 1], // за предыдущ. день (отнимаем от макс.знач)
      i * width + width,	    //
      height - array[i],     // цена в текущий день
      2,                      // толщина линии на графике
      'blue'
    );
}
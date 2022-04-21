/*  ПОИСК МАКСИМАЛЬНОГО ЧИСЛА В МАССИВЕ: */
let input = prompt('Введите числа через запятую');
let array = input.split(',');
for (let i = 0; i < array.length; i = i + 1) {
  array[i] = +array[i];
}
let result = array[0];
for (let i = 1; i < array.length; i = i + 1) {
  if (array[i] > result) {
  	result = array[i];
  }
}
console.log('Maximalnoe chislo: ' + result);
/* РАБОТА С ГРАФИКАМИ ?? */
function findMax(array) {
	let result = array[0];

	for (let i = 1; i < array.length; i = i + 1) {
	  if (array[i] > result) {
	  	result = array[i];
	  }
    }
	return result;
}

let prices = [100, 110, 140, 100, 150, 200, 130, 120];
let max = findMax(prices);

for (let i = 1; i < prices.length; i = i + 1) {
	drawLine(		             // ВНИМАНИЕ! функция только для GeekBrains!
      i * 10,		           // ежедневный прирост
      max - prices[i - 1], // за предыдущ. день (отнимаем от макс.знач)
      i * 10 + 10,	//
      max - prices[i],	   // цена в текущий день
      1,			             // толщина линии на графике
      'black',
    );
}

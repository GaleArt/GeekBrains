/*
    ЗАДАНИЕ №4.1.
ДОМАШНЕЕ ЗАДАНИЕ:
Вынесите алгоритм вычисления сложного банковского процента из прошлого
домашнего задания в отдельную функцию и усовершенствуйте программу: пусть она
выводит сложный процент за количество месяцев, которое указал пользователь,
затем за вдвое больший срок, затем за втрое больший срок.   */
// Объявляем переменные:
let depositValue = parseInt(prompt('Введите размер вклада'), 10);
let depositPercent = parseInt(prompt('Введите годовой процент (без знака %)'), 10);
let months = parseInt(prompt('Введите количество месяцев'), 10);
// Добавляем переменную для расчета внутри цикла:
let deposit = depositValue;
// Объявляем доп. фунцию расчета сложного процента:
function percentCalculator(deposit, percent, months) {
	for (let n = 1; n <= months; n = n + 1) {
	deposit = (deposit + deposit * (depositPercent / 100 / 12));
	}
  let depositProfit = deposit - depositValue;
  console.log('Полная сумма депозита за ' + months + ' месяцев: ' +
      deposit.toFixed(2) + ' рупий');
  console.log('Прибыль за ' + months + ' месяцев: ' +
      depositProfit.toFixed(2) + ' рупий');
  console.log(' ');			// пустая строка, лень выдумывать сложнее конструкции
}
// Выполняем требования домашки :)
percentCalculator (deposit, depositPercent, months);
percentCalculator (deposit, depositPercent, months * 2);
percentCalculator (deposit, depositPercent, months * 3);

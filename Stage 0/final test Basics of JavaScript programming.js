// Функция генерации выпавшего числа рулетки:
function roulette(max) {
  return Math.floor(Math.random() * max);
}
// Функция проверки дел у игрока:
function check (choice, score, bet) {
	if (choice == random) {
	  	score = score + bet * 37;
	    console.log('Ты победил! Твой выигрыш составил: ' + bet * 37 + '. Баланс: ' + score);
	} else if (choice == color) {
    	score = score + bet * 2;
	    console.log('Ты победил! Твой выигрыш составил: ' + bet * 2 + '. Баланс: ' + score);
    } else {
	  	score = score - bet;
		console.log('Штош! Баланс: ' + score);
	}
}

// Европейская рулетка! Массивы цветов согласно правил
let red = [32,19,21,25,34,27,36,30,23,5,16,1,14,9,18,7,12,3];
let black = [15,4,2,17,6,13,11,8,10,24,33,20,31,22,29,28,35,26];
let green = [0];
let color;
// Запрашиваем пожелание пользователя:
let userScore = 1000;
let userChoice = prompt('от 0 до 36');
let userBet = parseInt(prompt('stavka'));
// Крутим рулетку от 0 до 36:
let random = +roulette(37);	// random много где встречается, поэтому отдельную переменную
// Расчет принадлежности числа массивам цветов:
if (red.includes(random)) {
	color = 'red';
} else if (random == 0) {
	color = 'green :))))))';
} else {
	color = 'black';
}

// Рассказываем что выпало!
console.log('Выпало число: ' + random + ' ' + color);
check(userChoice, userScore, userBet);

function showMenu() {
    document.getElementById('menu').style.display = "block";
 }
 
function closeMenu() {
    document.getElementById('menu').style.display = "none";
}
function closeCart() {
    alert('удалил :)');
}
function closeCartAll() {
    alert('удалил всё :)');
}
function regAlert() {
    alert('Регистрация прошла успешно! :)');
}
/* Вешаем счетчик для корзины (секундомер потому что кнопки заняты)))) */
t=5;
function init(){
    document.getElementById('menu__bsk').innerHTML = t;
    t++;
    setTimeout("init()", 1000);
}
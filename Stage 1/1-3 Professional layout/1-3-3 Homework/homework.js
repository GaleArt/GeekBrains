function showMenu() {
    document.getElementById('menu').style.display = "block";
 }

function closeMenu() {
    document.getElementById('menu').style.display = "none";
}

/* Тут копипаст кода карусели для страницы Product */
(function() {
	"use strict";

	function Carousel(setting) {
		if(document.querySelector(setting.wrap) === null) {
			console.error(`Carousel not fount selector ${setting.wrap}`);
			return;
		}

		let privates = {};

		this.prev_slide = () => {
			--privates.opt.position;

			if(privates.opt.position < 0) {
				privates.sel.wrap.classList.add('s-notransition');
				privates.opt.position = privates.opt.max_position - 1;
			}
			privates.sel.wrap.style["transform"] = `translateX(-${privates.opt.position}00%)`;
		};

		this.next_slide = () => {
			++privates.opt.position;

			if(privates.opt.position >= privates.opt.max_position) {
				privates.opt.position = 0;
			}

			privates.sel.wrap.style["transform"] = `translateX(-${privates.opt.position}00%)`;
		};

		privates.setting = setting;

		privates.sel = {
			"main": document.querySelector(privates.setting.main),
			"wrap": document.querySelector(privates.setting.wrap),
			"children": document.querySelector(privates.setting.wrap).children,
			"prev": document.querySelector(privates.setting.prev),
			"next": document.querySelector(privates.setting.next)
		};

		privates.opt = {
			"position": 0,
			"max_position": document.querySelector(privates.setting.wrap).children.length
		};

		if(privates.sel.prev !== null) {
			privates.sel.prev.addEventListener('click', () => {
				this.prev_slide();
			});
		}

		if(privates.sel.next !== null) {
			privates.sel.next.addEventListener('click', () => {
				this.next_slide();
			});
		}
	}

	let a = new Carousel({
		"main": ".catalog__carousel__area",
		"wrap": ".catalog__carousel__wrap",
		"prev": ".catalog__carousel__btn__prev",
		"next": ".catalog__carousel__btn__next"
	});

})();
class Main {
  constructor() {
    this.header = document.querySelector(".header");
    this.sides = document.querySelectorAll(".side");
    this._observers = [];
    this._init();
  }

  set observers(val) {
    this._observers.push(val);
  }

  get observers() {
    return this._observers;
  }

  _init() {
    new MobileMenu();
    this.hero = new HeroSlider(".swiper-container");
    // this.__scrollInit();
    Pace.on("done", this._paceDone.bind(this)); //画面の更新後にアニメーション開始
  }

  _paceDone() {
    this.__scrollInit();
  }

  _inviewAnimation(el, isIntersecting) {
    if (isIntersecting) {
      el.classList.add("inview");
    }
  }

  _textAnimation(el, isIntersecting) {
    if (isIntersecting) {
      const ta = new TextAnimation(el);
      ta.animate();
    }
  }

  _headerAnimation(el, isIntersecting) {
    if (isIntersecting) {
      this.header.classList.add("so-header");
    } else {
      this.header.classList.remove("so-header");
    }
  }

  _sideAnimation(el, isIntersecting) {
    if (isIntersecting) {
      this.sides.forEach((side) => {
        side.classList.add("inview");
      });
    } else {
      side.classList.remove("inview");
    }
  }

  _toggleSwiper(el, inview) {
    if (inview) {
      this.hero.start(); //引数(delay)を入れてスライドの速さを変更できる
    } else {
      this.hero.stop();
    }
  }

  __scrollInit() {
    this._observers = new ScrollObserver(
      ".cover-slide",
      this._inviewAnimation,
      { rootMargin: "200px 0px" }
    );
    this._observers = new ScrollObserver(".animate-title", this._textAnimation);
    this._observers = new ScrollObserver(".appear", this._inviewAnimation);
    this._observers = new ScrollObserver(
      ".nav-triger",
      this._headerAnimation.bind(this)
    );
    this._observers = new ScrollObserver(
      ".swiper-container",
      this._toggleSwiper.bind(this)
    );
    this._observers = new ScrollObserver(
      "#main-content",
      this._sideAnimation.bind(this),
      { ones: false, rootMargin: "-300px 0px" }
    );
  }
}

class HeroSlider{
  constructor(el) {
    this.el = el;
    this.swiper = this._initSwiper();
  }
  _initSwiper(){
    return new Swiper(this.el, {
      // Optional parameters
      // direction: 'vertical',//上下方法のスライド
      loop: true,
      effect: 'coverflow',
      grabCursor: true,
      centeredSlides: true,
      slidesPerView: 1,
      speed: 1000,
      breakpoints: {
        1024: {
          slidesPerView: 2,
        },
      },
      // scrollbar: {
      //   el: '.swiper-scrollbar',
      // },
    })
  }

  start(options = {}){
    options = Object.assign({
      delay: 4000,
      disableOnInteraction: false //自分でスライドさせてもautoplayが継続
    },options);
    this.swiper.params.autoplay = options;
    this.swiper.autoplay.start();
  }
  // stop(){
  //   this.swiper.autoplay.stop();
  // }
}

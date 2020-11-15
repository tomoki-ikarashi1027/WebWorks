// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_directory ./vendors
//= require_tree .

document.addEventListener("DOMContentLoaded", function () {
  new MobileMenu();

  const hero = new HeroSlider('.swiper-container');
  hero.start();//引数(delay)を入れてスライドの速さを変更できる

  const cb = function (el, isIntersecting) {
    if (isIntersecting) {
      const ta = new TextAnimation(el);
      ta.animate();
    }
  };
  const cs = function (el ,isIntersecting) {
    if (isIntersecting) {
      el.classList.add('inview');
    }
  }

  const header = document.querySelector('.header');
  const nv = function (el, isIntersecting) {
    if (isIntersecting) {
      header.classList.add('so-header');
    } else {
      header.classList.remove('so-header');
    }
  }

  const ap = function (el, isIntersecting) {
    if (isIntersecting) {
      el.classList.add('inview');
    }
  }

  new ScrollObserver('.animate-title' ,cb);
  new ScrollObserver('.cover-slide' ,cs);
  new ScrollObserver('.nav-triger' ,nv);
  new ScrollObserver('.appear' ,ap);


});

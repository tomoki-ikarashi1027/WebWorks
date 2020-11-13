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

  // ta = new TextAnimation('.animate-title');
  // ta.animate();

  const els = document.querySelectorAll('.animate-title');
  const cb = function (entries, observer) {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        ta = new TextAnimation(entry.target);
        ta.animate();
        observer.unobserve(entry.target);
      } else {

      }
    });
  };

  const options = {
    root: null,
    rootMargin: '0px',
    threshold: 0
  };


  const io = new IntersectionObserver(cb, options);
  els.forEach(el => io.observe(el));
});

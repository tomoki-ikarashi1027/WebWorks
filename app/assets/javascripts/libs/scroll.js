class ScrollObserver{
  constructor(els,cb,options) {
    this.els = document.querySelectorAll(els);
    const defaultOptions = {
      root: null,
      rootMargin: '150px',
      threshold: 0,
      ones: true
    };
    this.options = Object.assign(defaultOptions, options); //defaultOptionsとoptionsをmarge
    this.cb = cb;
    this.ones = this.options.ones;
    this._init();
  }

  _init() {
    const callBack = function (entries, observer) {
      entries.forEach(entry => {
        if (entry.isIntersecting) {//要素が交差したら。
          this.cb(entry.target,true);
          if (this.ones) {
            observer.unobserve(entry.target);
          }
        } else {
          // this.cb(entry.target,false);
        }
      });
    };
    this.io = new IntersectionObserver(callBack.bind(this),this.options); //IntersectionObserverはwidowオブジェクトのためthisで束縛。
    this.els.forEach(el => this.io.observe(el));
  }
  destroy() {
    this.io.disconnect();
  }
}

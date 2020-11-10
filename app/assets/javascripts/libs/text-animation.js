// document.addEventListener('DOMContentLoaded', function () {
//   const el = document.querySelector('.animate-title'); 要素を取得
//   const str = el.innerHTML.trim().split(""); trimで不要な空白を削除しsplit("")で配列化。
//   str.reduce((acc, curr) => {
//     curr = curr.replace(' ', '&nbsp;');
//     return `${acc}<span class="char">${curr}</span>`;
//   },"");
//   let concatStr = ''; 空で用意


//   // for (let c of str) {
//   //   c = c.replace(' ', '&nbsp;'); 空文字が入ったら変換
//   //   concatStr +=  `<span class="char">${c}</span>` ＋でspan要素を連結
//   // }
       // el.innerHTML = concatStr 取得したHTML要素を上記のspanタグで囲む

//   el.innerHTML = str.reduce((acc, curr) => { currに配列が一つずつ格納される。上記のfor文のcと同じ意味合い
//     curr = curr.replace(' ', '&nbsp;');
//     return `${acc}<span class="char">${curr}</span>`;
//   },"");

// })

class TextAnimation{
  constructor(el) {
    this.DOM = {};
    this.DOM.el = document.querySelector(el);
    this.chars = this.DOM.el.innerHTML.trim().split("");
    this.DOM.el.innerHTML = this._splitText();
  }

  _splitText() {
    return this.chars.reduce((acc, curr) => {
      curr = curr.replace(/\s+/, '&nbsp;');// /\s+/(正規表現) -> " "と同じ
      return `${acc}<span class="char">${curr}</span>`;
    },"");
  }

  animate() {
    this.DOM.el.classList.toggle('inview');
  }
}

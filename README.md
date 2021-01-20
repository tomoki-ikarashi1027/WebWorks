# WebWorks
http://54.95.126.208/
# 概要
 プログラマーの転職活動を手助けするアプリケーションです。
 
# 機能
* 会員登録  
* 掲載企業の追加・更新・削除  
* データ検索  
  ⅰ. フリーワードで  
  ⅱ. プログラミング言語から  
  ⅲ. フレームワークから  
* 画像投稿  
* レビュー  
* お問い合わせ (メールの送信と返信)  
* カレンダー  
* Todoリスト  
* メモ  

### 技術面での工夫  
* BEM記法での実装  
* Swiperを使用したアニメーションの実装  
* レスポンシブ対応  
* axiosを用いた非同期通信  
* 日本語化によるユーザビリティの向上  
* 自分以外のタスクを非表示に  
* ページネーションの実装
* IntersectionObserverを使ったスクロール処理の実装  
* CSSでのアニメーションの実装  
* カレンダー機能にて投稿蘭をモーダルを用いて表示  
* pace.jsを用いたローダーの実装


# 使用言語
・ruby 2.6.3  
・Rails 5.2.3  
・javascript/vue.js/jQuery 

# 使用技術
### 開発環境
・Docker + Docker-compose

### インフラ
・AWS(EC2, RDS, Puma)  
・Nginx(Webサーバ)  
・MySQL2

### Gemなど
* devise (認証機能)  
* kaminari (ページネーション)  
* bootstrap-sass  
* bulma-rails
* carrierwave    
* simple_calendar  
* jquery-rails  
* rails-i18n (日本語化)  
* webpacker
* font-awesome  

# 使い方
### 管理者ページ
* ヘッダーの「admins」より管理者ページへログイン。
* トップページの以下4つのリンクから用途に合わせて遷移。    
* 【Mail】メールの確認と返信。  
* 【Reviews】レビューコメントの確認、削除。  
* 【Company】掲載企業の追加、編集、削除。  
* 【Language】タグの追加、削除。

### Customer側
* ヘッダーの「Log in」からユーザー側のページへログイン。  
* ヘッダーの「Contact」から管理者へお問い合わせメールを送信できます。
* 【Big Cityセクション】 掲載企業の確認、レビューの投稿。  
* 【タスク管理セクション】　自分に合ったタスク管理ツールを使用。（画像がリンクになっています。）  

# インストール
 ```
$ git clone https://github.com/tomoki-ikarashi1027/WebWorks.git
$ cd WebWorks
$ bundle install
$ rails db:migrate
$ rails db:seed

テストユーザー： mail "test1@user", password "123456"
管理者： mail "test@admin", password "123456"
```

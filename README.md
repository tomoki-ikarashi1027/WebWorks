# WebWorks
http://web-works.work/
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
* 画像プレビュー  
* チャット  
* 通知  
* いいね

### 技術面での工夫  
* BEM記法での実装  
* swiper.cssを使用したアニメーションの実装  
* レスポンシブ対応  
* axiosを用いた非同期通信  
* 日本語化によるユーザビリティの向上  
* 自分以外のタスクを非表示に  
* ページネーションの実装
* IntersectionObserverを使ったスクロール処理の実装  
* CSSでのアニメーションの実装  
* モーダルを用いた表示方法  
* pace.jsを用いたローダーの実装  
* Action Cableを使用したチャット機能の実装  
* チャット受信時の通知機能実装


# 使用言語
* ruby 2.6.3  
* Rails 5.2.3  
* javascript/vue.js/jQuery 

# 使用技術
### 開発環境
* Docker + Docker-compose

### インフラ
* AWS(EC2, RDS, Route53)
* Puma
* Nginx(Webサーバ)  
* MySQL2

### Gemなど
* Rspec (モデルテスト、コントローラテスト、システムテスト)  
* CircleCI
* devise (認証機能)  
* kaminari (ページネーション)  
* bootstrap-sass  
* bulma-rails
* carrierwave (画像投稿)    
* simple_calendar (スケジュール機能)  
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
* ヘッダーの「Contact」から管理者へお問い合わせメールを送信。
* 【Big Cityセクション】掲載企業の確認、レビューの投稿。  
* 【Community Square】近況などを投稿。User一覧画面よりチャットページへ遷移。（プロフィールからも可）
* 【タスク管理セクション】自分に合ったタスク管理ツールを使用。（画像がリンクになっています。）  

# インストール
 ```
$ git clone https://github.com/tomoki-ikarashi1027/WebWorks.git
$ cd WebWorks
$ docker-compose build
$ docker-compose run web rails db:create
$ docker-compose run web rails db:migrate
$ docker-compose up


テストユーザー： mail "test1@user", password "123456"
管理者： mail "test@admin", password "123456"
```

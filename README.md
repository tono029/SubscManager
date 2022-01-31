# SubscManager
"SubscManager"は利用しているサブスクリプションサービスを登録し、管理することを目的としたサービスです。

# URL
* [SubscManager](https://subscmanager.herokuapp.com/)

# 使用技術
* Ruby
* Ruby on Rails
* heroku

# 機能
* ユーザー登録、ログイン(devise)
* サービス管理
    * 月々の料金計算
    * 円グラフによる内訳の可視化(chartkick)
    * サービス追加
    * 内容編集
    * 当該サービスへのリンク設定
    * 削除
* ページネーション(kaminari)

# 追加したい機能
* テンプレートから登録

# テスト
* capybara
* rspec
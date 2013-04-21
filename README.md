# Chatworker

登録されているアイコンのクラス名と画像を返す API です。

## インストール

### ローカル

```
$ git clone git://github.com/asonas/chatworker.git
$ cd chatworker
$ bundle install
$ rake db:create db:migrate
$ bundle exec rails s
```

[http://localhost:3000](http://localhost:3000) にアクセスします。

### Heroku

```
$ heroku create
$ git push heroku master
```

## 使い方

### アイコンの登録

1. Chatworker にアクセスし、メニューの「Create and update icon」よりアイコンの登録ページを開きます。

2. 置換したいアイコンのクラス名と、新しい画像ファイルを指定し、「Create Icon」で登録を行います。

  クラス名には、アイコンの `img` タグに `cw_a123456` といったクラスが振られていますので、そのクラス名を指定します。アイコンを右クリックして「要素を検証」で見つけることができます。

  画像ファイルは、サイズが 10KB 以内のものを指定してください。

### API

Chatworker が動いているドメインの `/icons.json` (例えば [http://localhost:3000/icons.json](http://localhost:3000/icons.json) ) にアクセスします。

以下のようなレスポンスが返ってきます:

```json
[
  {
    "class_name": "cw_a123456",
    "data_uri_encoded_data": "data:image/jpeg;base64, ..."
  }
]
```

* **class_name**: 登録されているクラス名
* **data_uri_encoded_data**: 登録されている画像を data URI scheme に変換したもの

## chatwork-replace-icons-extension

Google Chrome のエクステンションである、 [chatwork-replace-icons-extension](https://github.com/chocoby/chatwork-replace-icons-extension) と併用することにより、ChatWork 内のアイコンを置換することができます。

詳しくは、 chatwork-replace-icons-extension の README を参照してください。

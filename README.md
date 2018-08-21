# WIP

# OnePage
OnePageとは、プログラミングに特化したスライド共有サービスです。
ただスライドを共有するだけではなく1ページにまとめたスライドも一緒に投稿することでスライドを読まなくても
内容が把握できるようになっているのがこのサービスの特徴です。

## 動作環境
以下の環境で動作することを確認しています。

- ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin14]
- rails (~> 5.1.4)
- yarn (1.5.1)
- node (v8.0.0)

## 開発に必要な知識
- rails
- [grape](https://github.com/ruby-grape/grape)
- swagger
- vuejs(フロントエンドのフレームワーク)
- webpack
- [bulma](https://bulma.io/)
- storybook

## 動作確認

#### backend
```
$ bin/rails db:setup
$ bin/rails s
```

#### frontend
```
$ cd frontend
$ npm run dev
```

#### swagger
```
$ docker run -p 5000:8080 swaggerapi/swagger-ui
$ open localhost:5000
```

1. 開いた画面の検索バーに「http://localhost:3000/api/v1/swagger_doc」を入力する
2. Explore

[![Image from Gyazo](https://i.gyazo.com/22ed427a2857d504eaff9af7139d74ae.png)](https://gyazo.com/22ed427a2857d504eaff9af7139d74ae)

#### storybook
```
$ yarn storybook
```

[![Image from Gyazo](https://i.gyazo.com/c0687eb44fb5b2f3d1b2a8d9cae2cf6b.png)](https://gyazo.com/c0687eb44fb5b2f3d1b2a8d9cae2cf6b)






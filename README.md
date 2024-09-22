# アプリケーション名

Just Do It

# アプリケーション概要

タスクの管理と終了タスクの確認ができます。頭の中のやらなきゃというモヤモヤを、すべて吐き出すためのアプリです。

# URL

- https://kadaikanriserviceapp.com/
- ログインページで Login Guest をクリックお願いします。

# 利用方法

1. メールアドレス・パスワードを入力しログインします。
2. タスクを打ち込み送信します。
3. 一つのタスクが完了したら、タスク横の DONE ボタンをクリックします。
4. 完了タスクはすべて Archive に保存されます。
5. 今の作業に集中するとき、タスクをクリックすると画面いっぱいに表示されます。(フォーカス機能)
6. フォーカス機能中も下の入力欄が使えるので、追加タスクを送信できます。

# アプリケーションを作成した背景

- 次々に仕事が増える場面で、シンプルにメモを残したい人へ向けて開発しました。完了していないタスクが一目でわかり、今やっていることに集中できるアプリケーションです。

# 洗い出した要件

- https://docs.google.com/spreadsheets/d/1YM1vaRb0EL6G3MXe_A0g3NgrtLMiu6er8C5Q75w3FxQ/edit#gid=1002713410

# 実装した機能についての画像や GIF およびその説明

![7e3a1f0e0a4e5f3b5b2deb971cedda3e](https://github.com/ruu2023/jdi-app/assets/125800583/a06b40bf-7832-4153-867d-ab095b88efd8)
![f8f705975f945c46abc58794bdbbc054](https://github.com/ruu2023/jdi-app/assets/125800583/dd59aa86-824c-4d6f-8cb4-edcad2f4677c)
![df7eff751455b1ebbf3c9893c971f4f5](https://github.com/ruu2023/jdi-app/assets/125800583/45ff5185-e123-4a41-9d4e-246bf00b5bfe)
![a89932eedb137cbeea27638368a051c1](https://github.com/ruu2023/jdi-app/assets/125800583/9efa1f45-d77c-4990-a456-5996b724b5f7)

- タスクを送信できる投稿機能
  1.  タスクを入力し送信します。
  2.  タスクが送信順に表示されます。
- タスクを完了できるアーカイブ機能
  1.  タスクの DONE ボタンをクリックします。
  2.  完了タスクがアーカイブに移動されます。
- 1 つのタスクをクリックすると、他のタスクを見えなくするフォーカス機能
  1.  タスクのタイトルをクリックします。
  2.  そのタスクのみモーダルウィンドウで表示されます。
- タスクを並び替えできるソート機能
  1.  タスクをドラッグします。
  2.  タスクの並び順を変更できます。

# 実装予定の機能

- タスクの「今はやらない」フォルダを作ります。

# データベース設計

![database](https://github.com/user-attachments/assets/22c156bf-d667-4143-8d50-99a1047f6211)

# 画面遷移図

![window](https://github.com/user-attachments/assets/3f038095-0a38-43c7-b9b2-ef924c9a97dc)

# 開発環境

- フロントエンド HTML/CSS
- バックエンド Ruby on Rails
- インフラ ConohaVPS
- テスト RSpec
- テキストエディタ VSCode

# ローカルでの動作方法

以下のコマンドを順に実行

```
% git clone https://github.com/ruu2023/jdi-app
% cd jdi-app
% bundle install
% yarn install
```

# 工夫したポイント

- タスクを抱えて頭がモヤモヤすることを解消したく制作しました。Ruby on Rails にてアプリを作成し、sortablejs ライブラリを使用し、タスクの入れ替えができるようにしました。また、css や javascript にてレスポンシブ対応を行いました。

# 改善点

- ユーザーによってはタスクを複数のフォルダに分けると思いますので、自由度の高いフォルダー作成機能を追加したいです。

# 制作時間

- 55h

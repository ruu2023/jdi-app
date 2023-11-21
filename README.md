# アプリケーション名
Just Do It
# アプリケーション概要
タスクの管理と終了タスクの確認ができます。頭の中のやらなきゃというモヤモヤを、すべて吐き出すためのアプリです。
# URL
- <デプロイ後入力します。>
# テスト用アカウント
- <デプロイ後入力します。>
# 利用方法
1. メールアドレス・パスワードを入力しログイン。
2. タスクを打ち込み送信します。
3. 一つのタスクが完了したら、タスク横のDONEボタンをクリック。
4. 完了タスクはすべてArchiveに保存されます。
5. 今の作業に集中するとき、タスクをクリックすると画面いっぱいに表示されます。(フォーカス機能)
6. フォーカス機能中も下の入力欄が使えるので、追加タスクを送信できます。
# アプリケーションを作成した背景
- 次々に仕事が増える場面で、シンプルにメモを残したい人へ向けて開発しました。完了していないタスクが一目でわかり、今やっていることに集中できるアプリケーションです。
# 洗い出した要件
- https://docs.google.com/spreadsheets/d/1YM1vaRb0EL6G3MXe_A0g3NgrtLMiu6er8C5Q75w3FxQ/edit#gid=1002713410
# 実装した機能についての画像やGIFおよびその説明
- <画像は後ほど掲載します。>
- タスクを送信できる投稿機能
- タスクを完了できるアーカイブ機能
- 1つのタスクをクリックすると、他のタスクを見えなくするフォーカス機能
- タスクを並び替えできるソート機能
# 実装予定の機能
- タスクの「今はやらない」エリアを作る
# データベース設計
	![](2023-11-21-14-24-36.png)
# 画面遷移図
	![](2023-11-21-14-24-42.png)
# 開発環境
- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理
# ローカルでの動作方法
以下のコマンドを順に実行
```
% git clone https://github.com/ruu2023/jdi-app
% cd jdi-app
% bundle install
% yarn install
```
# 工夫したポイント
- タスクを抱えて頭がモヤモヤすることを解消したく制作しました。Ruby on Railsにてアプリを作成し、sortablejsライブラリを使用し、タスクの入れ替えができるようにしました。また、cssやjavascriptにてレスポンシブ対応を行いました。
# 改善点
- ユーザーによってはタスクを複数のフォルダに分けると思いますので、自由度の高いフォルダー作成を追加したいです。
# 制作時間
- 30h

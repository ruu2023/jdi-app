# アプリケーション名
Just Do It
# アプリケーション概要
タスクの管理と終了タスクの確認ができます。頭の中のやらなきゃというモヤモヤを、すべて吐き出すためのアプリです。
# URL
デプロイ済みのURLを記載。デプロイが済んでいない場合は、デプロイが完了次第記載すること。
# テスト用アカウント
ログイン機能等を実装した場合は、ログインに必要な情報を記載。またBasic認証等を設けている場合は、そのID/Passも記載すること。
# 利用方法
- ユーザーでログイン
- タスクを打ち込みセンド
- 一つのタスクが完了したら、タスク横のチェックをつける
- 完了タスクはすべてArchiveに保存される
- 今の作業に集中するとき、タスクをクリックすると画面いっぱいに表示される。集中モード
- 集中モード中も下の入力欄が使えるので、追加タスクもセンドできる
# アプリケーションを作成した背景
次々に仕事が増える場面で、シンプルにメモを残したい人へ向けて開発しました。
完了していないタスクが人目でわかり、今やっていることに集中できるアプリケーションです。
# 洗い出した要件
要件定義をまとめたスプレッドシートのリンクを記載。
# 実装した機能についての画像やGIFおよびその説明
実装した機能について、それぞれどのような特徴があるのかを列挙する形で記載。画像はGyazoで、GIFはGyazoGIFで撮影すること。
# 実装予定の機能
洗い出した要件の中から、今後実装予定の機能がある場合は、その機能を記載。
# データベース設計
	ER図を添付。
# 画面遷移図
	画面遷移図を添付。
# 開発環境
- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理
# ローカルでの動作方法
	git cloneしてから、ローカルで動作をさせるまでに必要なコマンドを記載。
# 工夫したポイント
	制作背景・使用技術・開発方法・タスク管理など、企業へＰＲしたい事柄を記載。
# 改善点
	より改善するとしたらどこか、それはどのようにしてやるのか。
# 制作時間
	アプリケーションを制作するのにかけた時間。

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :folder_users
- has_many :folders, through: :folder_users
- has_many :messages

## folders テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :folder_users
- has_many :users, through: :folder_users
- has_many :messages

## folder_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| folder | references | null: false, foreign_key: true |

### Association

- belongs_to :folder
- belongs_to :user

## tasks テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| check_done | integer     |                                |
| user    | references | null: false, foreign_key: true |
| folders | references | null: false, foreign_key: true |

### Association

- belongs_to :folders
- belongs_to :user
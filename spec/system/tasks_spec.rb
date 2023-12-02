require 'rails_helper'

RSpec.describe "Tasks", type: :system do
  before do
    # 中間テーブルを作成して、usersテーブルとroomsテーブルのレコードを作成する
    @user = FactoryBot.create(:user)
  end

  context '投稿に失敗したとき' do
    it '送る値が空の為、メッセージの送信に失敗する' do
      # サインインする
      sign_in(@user)
      # DBに保存されていないことを確認する
      expect {
        find('input[name="commit"]').click
        sleep 1
      }.not_to change { Task.count }
      # 元のページに戻ってくることを確認する
      expect(current_path).to eq(root_path)
    end
  end

  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
      # サインインする
      sign_in(@user)
      # 値をテキストフォームに入力する
      post = 'テスト'
      fill_in 'task_content', with: post
      # 送信した値がDBに保存されていることを確認する
      expect {
        find('input[name="commit"]').click
        sleep 1
      }.to change { Task.count }.by(1)
      # 投稿一覧画面に遷移していることを確認する
      expect(current_path).to eq(root_path)
      # 送信した値がブラウザに表示されていることを確認する
      expect(page).to have_content(post)
    end
  end
end

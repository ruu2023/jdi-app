require 'rails_helper'

RSpec.describe Task, type: :model do
  before do
    @task = FactoryBot.build(:task)
  end

  describe 'タスク送信' do
    context 'タスクが送信できる場合' do
      it 'contentが存在していれば保存できる' do
        expect(@task).to be_valid
      end
    end
    context 'タスクが送信できない場合' do
      it 'contentが空では保存できない' do
        @task.content = ''
        @task.valid?
        expect(@task.errors.full_messages).to include("Content can't be blank")
      end
      it 'userが紐付いていないと保存できない' do
        @task.user = nil
        @task.valid?
        expect(@task.errors.full_messages).to include("User must exist")
      end
    end
  end
end

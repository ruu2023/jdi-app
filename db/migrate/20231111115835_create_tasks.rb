class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :content
      t.integer :priority
      t.references :user, null: false, foreign_key: true
      t.references :folder, null: false, foreign_key: true
      t.timestamps
    end
  end
end

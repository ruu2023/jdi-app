class CreateArchives < ActiveRecord::Migration[7.0]
  def change
    create_table :archives do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :folder, null: false, foreign_key: true
      t.integer :row_order
      t.timestamps
    end
  end
end

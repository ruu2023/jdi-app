class RemoveTaskToArchives < ActiveRecord::Migration[7.0]
  def change
    # add_column :archives, :task_id, :bigint, null: false
    add_foreign_key :archives, :tasks, column: :task_id
  end
end

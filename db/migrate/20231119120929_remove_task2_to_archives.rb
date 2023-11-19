class RemoveTask2ToArchives < ActiveRecord::Migration[7.0]
  def change
    remove_column :archives, :task_id
  end
end

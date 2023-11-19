class RemoveFolderToTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :folder_id
  end
end

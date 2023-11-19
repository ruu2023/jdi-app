class RemoveFolderToArchives < ActiveRecord::Migration[7.0]
  def change
    remove_column :archives, :folder_id
  end
end

class RemoveRowOrderToTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :position
  end
end

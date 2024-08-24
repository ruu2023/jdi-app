class UpdateTasksTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :priority, :integer
    add_column :tasks, :row_order, :integer
  end
end

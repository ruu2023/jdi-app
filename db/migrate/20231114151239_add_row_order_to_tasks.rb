class AddRowOrderToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :row_order, :integer
  end
end
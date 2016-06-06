class AddTotalToDMovements < ActiveRecord::Migration
  def change
    add_column :d_movements, :total, :decimal
  end
end

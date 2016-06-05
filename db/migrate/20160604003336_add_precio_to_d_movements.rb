class AddPrecioToDMovements < ActiveRecord::Migration
  def change
    add_column :d_movements, :precio, :decimal
  end
end

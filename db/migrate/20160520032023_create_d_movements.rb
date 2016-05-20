class CreateDMovements < ActiveRecord::Migration
  def change
    create_table :d_movements do |t|
      t.references :movement, index: true
      t.references :product, index: true
      t.integer :cantidad

      t.timestamps null: false
    end
    add_foreign_key :d_movements, :movements
    add_foreign_key :d_movements, :products
  end
end

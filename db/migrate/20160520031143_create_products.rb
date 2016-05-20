class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :codigo
      t.string :nombre
      t.string :descripcion
      t.string :unidad_medida
      t.decimal :costo
      t.decimal :precio_venta
      t.integer :cantidad
      t.integer :canitdad_min
      t.references :brand, index: true
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :products, :brands
    add_foreign_key :products, :categories
  end
end

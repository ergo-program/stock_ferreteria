class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :nombre
      t.string :direccion
      t.string :telefono
      t.string :email
      t.string :imagen
      t.integer :tiempo_espera

      t.timestamps null: false
    end
  end
end

class CreateParameters < ActiveRecord::Migration
  def change
    create_table :parameters do |t|
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

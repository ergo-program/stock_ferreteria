class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :nombre
      t.string :telefono
      t.string :direccion
      t.string :documento
      t.string :tipo

      t.timestamps null: false
    end
  end
end

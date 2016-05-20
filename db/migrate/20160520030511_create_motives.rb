class CreateMotives < ActiveRecord::Migration
  def change
    create_table :motives do |t|
      t.string :descripcion

      t.timestamps null: false
    end
  end
end

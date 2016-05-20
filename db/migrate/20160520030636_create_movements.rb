class CreateMovements < ActiveRecord::Migration
  def change
    create_table :movements do |t|
      t.date :fecha
      t.references :motive, index: true
      t.string :tipo
      t.references :person, index: true

      t.timestamps null: false
    end
    add_foreign_key :movements, :motives
    add_foreign_key :movements, :people
  end
end

class CreateEncounters < ActiveRecord::Migration[5.0]
  def change
    create_table :encounters do |t|
      t.text :name, null: false
      t.integer :experience_points
      t.text :description
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end

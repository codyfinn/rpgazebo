class CreateCharacters < ActiveRecord::Migration[5.0]
  def change
    create_table :characters do |t|
      t.text :name
      t.text :bio
      t.integer :level
      t.integer :hit_points
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end

class CreateCharacterAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :character_attributes do |t|
      t.integer :ability_score
      t.integer :ability_modifier
      t.references :character, foreign_key: true
      t.references :base_attribute, foreign_key: true

      t.timestamps
    end
  end
end

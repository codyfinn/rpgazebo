class CreateCharacterAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :character_attributes do |t|
      t.integer :value
      t.integer :modifier

      t.timestamps
    end
  end
end

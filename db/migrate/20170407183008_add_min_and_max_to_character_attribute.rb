class AddMinAndMaxToCharacterAttribute < ActiveRecord::Migration[5.0]
  def change
    add_column :character_attributes, :min, :integer
    add_column :character_attributes, :max, :integer
  end
end

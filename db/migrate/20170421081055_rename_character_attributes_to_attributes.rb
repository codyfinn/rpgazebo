class RenameCharacterAttributesToAttributes < ActiveRecord::Migration[5.0]
  def change
    rename_table :character_attributes, :attributes
  end
end

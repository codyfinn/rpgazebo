class RemoveValueFromCharacterAttributes < ActiveRecord::Migration[5.0]
  def change

    remove_column :character_attributes, :value
    
  end
end

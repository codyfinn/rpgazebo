class MakeItemsNameNotNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :items, :name, false
  end
end

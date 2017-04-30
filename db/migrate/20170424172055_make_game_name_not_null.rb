class MakeGameNameNotNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :games, :name, false
  end
end

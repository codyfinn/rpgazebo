class AddGameIdToCharacters < ActiveRecord::Migration[5.0]
  def change
    add_column :characters, :game_id, :integer

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE
            characters
          SET
            game_id = 0;
        SQL
      end
    end

    change_column_null :characters, :game_id, from: true, to: false

    add_index :characters, :game_id
  end
end

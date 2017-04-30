class AddGameIdToEncounters < ActiveRecord::Migration[5.0]
  def change
    add_column :encounters, :game_id, :integer

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE
            encounters
          SET
            game_id = 0;
        SQL
      end
    end

    change_column_null :encounters, :game_id, from: true, to: false

    add_index :encounters, :game_id
  end
end

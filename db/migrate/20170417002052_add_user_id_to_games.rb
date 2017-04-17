class AddUserIdToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :user_id, :integer

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE
            games
          SET
            user_id = 0;
        SQL
      end
    end

    change_column_null :games, :user_id, from: true, to: false
    
    add_index :games, :user_id
  end
end

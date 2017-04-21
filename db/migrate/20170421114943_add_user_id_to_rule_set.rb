class AddUserIdToRuleSet < ActiveRecord::Migration[5.0]
  def change
    add_column :rule_sets, :user_id, :integer

    reversible do |dir|
      dir.up do
        execute <<-SQL
          UPDATE
            rule_sets
          SET
            user_id = 0;
        SQL
      end
    end

    change_column_null :rule_sets, :user_id, from: true, to: false

    add_index :rule_sets, :user_id
  end
end

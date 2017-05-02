class AddRuleSetToGames < ActiveRecord::Migration[5.0]
  def change
    add_reference :games, :rule_set, foreign_key: true
  end
end

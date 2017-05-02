class AddUserToRuleSet < ActiveRecord::Migration[5.0]
  def change
    add_reference :rule_sets, :user, foreign_key: true
  end
end

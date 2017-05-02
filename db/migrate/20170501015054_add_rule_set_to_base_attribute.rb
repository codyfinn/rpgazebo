class AddRuleSetToBaseAttribute < ActiveRecord::Migration[5.0]
  def change
    add_reference :base_attributes, :rule_set, foreign_key: true
  end
end

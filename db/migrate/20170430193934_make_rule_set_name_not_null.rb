class MakeRuleSetNameNotNull < ActiveRecord::Migration[5.0]
  def change
    change_column_null :rule_sets, :name, false
  end
end

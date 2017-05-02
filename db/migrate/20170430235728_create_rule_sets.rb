class CreateRuleSets < ActiveRecord::Migration[5.0]
  def change
    create_table :rule_sets do |t|
      t.text :name, null: false
      t.text :description

      t.timestamps
    end
  end
end

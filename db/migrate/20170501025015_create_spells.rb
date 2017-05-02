class CreateSpells < ActiveRecord::Migration[5.0]
  def change
    create_table :spells do |t|
      t.text :name, null: false
      t.text :description
      t.references :rule_set, foreign_key: true

      t.timestamps
    end
  end
end

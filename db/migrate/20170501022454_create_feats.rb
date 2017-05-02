class CreateFeats < ActiveRecord::Migration[5.0]
  def change
    create_table :feats do |t|
      t.text :name, null: false
      t.text :description
      t.references :rule_set, foreign_key: true

      t.timestamps
    end
  end
end

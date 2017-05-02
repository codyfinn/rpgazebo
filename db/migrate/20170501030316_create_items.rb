class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.text :name
      t.integer :price
      t.text :description
      t.references :rule_set, foreign_key: true

      t.timestamps
    end
  end
end

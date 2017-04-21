class CreateAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :attributes do |t|
      t.text :name
      t.text :description
      t.integer :min
      t.integer :max

      t.timestamps
    end
  end
end

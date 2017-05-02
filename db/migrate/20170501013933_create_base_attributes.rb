class CreateBaseAttributes < ActiveRecord::Migration[5.0]
  def change
    create_table :base_attributes do |t|
      t.text :name, null: false
      t.text :description

      t.timestamps
    end
  end
end

class CreateEncounters < ActiveRecord::Migration[5.0]
  def change
    create_table :encounters do |t|
      t.text :name, null: false

      t.timestamps
    end
  end
end

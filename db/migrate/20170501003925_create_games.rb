class CreateGames < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.text :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
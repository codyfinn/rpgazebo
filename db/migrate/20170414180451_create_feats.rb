class CreateFeats < ActiveRecord::Migration[5.0]
  def change
    create_table :feats do |t|
      t.string :feat_name
      t.text :description

      t.timestamps
    end
  end
end

class AddNameAndBodyToNotes < ActiveRecord::Migration[5.0]
  def change
    change_table :notes do |t|      
      t.text :name, null: false
      t.text :body
    end

    execute <<-SQL
      ALTER TABLE
        notes
      ADD CONSTRAINT
        check_constraint_name CHECK (length(name) <= 64);
    SQL
    
    execute <<-SQL
      ALTER TABLE
        notes
      ADD CONSTRAINT
        check_constraint_body CHECK (length(body) <= 4096);
    SQL
  end
end


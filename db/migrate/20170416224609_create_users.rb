class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.text :name, null: false
      t.text :provider, null: false
      t.text :uid, null: false

      t.timestamps
    end

    add_index :users, [:provider, :uid], unique: true

    execute <<-SQL
      ALTER TABLE
        users
      ADD CONSTRAINT
        check_constraint_name CHECK (length(name) <= 64);
    SQL

    execute <<-SQL
      ALTER TABLE
        users
      ADD CONSTRAINT
        check_constraint_provider CHECK (length(provider) <= 64);
    SQL

    execute <<-SQL
      ALTER TABLE
        users
      ADD CONSTRAINT
        check_constraint_uid CHECK (length(uid) <= 512);
    SQL
  end
end

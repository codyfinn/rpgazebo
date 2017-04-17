class CreateIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :identities do |t|
      t.text :email, null: false
      t.text :name, null: false
      t.text :password_digest, null: false

      t.timestamps
    end

    add_index :identities, :email, unique: true

    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE
            identities
          ADD CONSTRAINT
            check_constraint_email CHECK (length(email) <= 256);
        SQL

        execute <<-SQL
          ALTER TABLE
            identities
          ADD CONSTRAINT
            check_constraint_name CHECK (length(name) <= 64);
        SQL

        execute <<-SQL
          ALTER TABLE
            identities
          ADD CONSTRAINT
            check_constraint_password_digest CHECK (length(password_digest) <= 128);
        SQL
      end

      dir.down do
        execute <<-SQL
          ALTER TABLE
            identities
          DROP CONSTRAINT
            check_constraint_email;
        SQL

        execute <<-SQL
          ALTER TABLE
            identities
          DROP CONSTRAINT
            check_constraint_name;
        SQL

        execute <<-SQL
          ALTER TABLE
            identities
          DROP CONSTRAINT
            check_constraint_password_digest;
        SQL
      end
    end
  end
end

class AddNameAndPasswordDigestToUsers < ActiveRecord::Migration
  def up
    add_column :users, :name, :string
    add_column :users, :password_digest, :string
  end

  def down
    drop_column :users, :name
    drop_column :users, :password_digest
  end
end

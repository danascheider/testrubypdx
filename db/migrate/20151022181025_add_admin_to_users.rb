class AddAdminToUsers < ActiveRecord::Migration
  def up
    add_column :users, :admin, :boolean, default: false
  end

  def down
    drop_column :users, :admin
  end
end

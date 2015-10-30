class DropDateFromTalks < ActiveRecord::Migration
  def up
    remove_column :talks, :date
  end

  def down
    add_column :talks, :date, :date
  end
end

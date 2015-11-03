class AddTimeToMeetings < ActiveRecord::Migration
  def up
    add_column :meetings, :time, :time
  end

  def down
    remove_column :meetings, :time
  end
end

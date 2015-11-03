class ChangeDatetimeToDateOnMeetings < ActiveRecord::Migration
  def up
    change_column :meetings, :date, :date
  end

  def down
    change_column :meetings, :date, :datetime
  end
end

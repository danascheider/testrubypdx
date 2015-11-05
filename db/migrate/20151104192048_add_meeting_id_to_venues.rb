class AddMeetingIdToVenues < ActiveRecord::Migration
  def up
    add_column :venues, :meeting_id, :integer
  end

  def down
    remove_column :venues, :meeting_id
  end
end

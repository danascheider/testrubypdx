class AddVenueIdToMeetings < ActiveRecord::Migration
  def up
    add_column :meetings, :venue_id, :integer
  end

  def down
    remove_column :meetings, :venue_id
  end
end

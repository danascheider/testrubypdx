class AddDescriptionToMeetings < ActiveRecord::Migration
  def up
    add_column :meetings, :description, :string
  end

  def down
    drop_column :meetings, :description
  end
end

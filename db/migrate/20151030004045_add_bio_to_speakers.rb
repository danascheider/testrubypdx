class AddBioToSpeakers < ActiveRecord::Migration
  def up
    add_column :speakers, :bio, :string
  end

  def down
    remove_column :speakers, :bio
  end
end

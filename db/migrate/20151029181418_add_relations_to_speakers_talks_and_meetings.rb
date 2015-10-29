class AddRelationsToSpeakersTalksAndMeetings < ActiveRecord::Migration
  def change
    change_table :talks do |t|
      t.belongs_to :meeting, index: true
      t.belongs_to :speaker, index: true
    end
  end
end

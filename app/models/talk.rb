class Talk < ActiveRecord::Base
  belongs_to :speaker
  belongs_to :meeting

  validates_presence_of :title
end

class Talk < ActiveRecord::Base
  belongs_to :speaker
  belongs_to :meeting
end

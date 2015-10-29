class Speaker < ActiveRecord::Base
  has_many :talks
  has_many :meetings, through: :talks
end

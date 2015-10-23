class Meeting < ActiveRecord::Base
  validates_presence_of :date

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end

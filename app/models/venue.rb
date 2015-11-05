class Venue < ActiveRecord::Base
  has_many :meetings
  validates_presence_of :address_1
  validates :zip, format: {with: /\A[0-9]{5}(-[0-9]{4})?\z/, allow_blank: true}
  before_create :set_defaults

  private
    def set_defaults
      self.city ||= 'Portland'
      self.state ||= 'Oregon'
    end
end

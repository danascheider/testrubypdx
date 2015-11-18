class Meeting < ActiveRecord::Base
  has_many :talks
  has_many :speakers, through: :talks
  belongs_to :venue
  
  validates_presence_of :date

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }

  class << self
    def soonest
      Meeting.upcoming.order('date ASC').first
    end
  end

  def display_date
    datetime = date.to_datetime
    weekday = DateTime::DAYNAMES[datetime.cwday == 7 ? 0 : datetime.cwday]
    month = DateTime::MONTHNAMES[datetime.month]
    day = datetime.day
    year = datetime.year

    "#{weekday}, #{month} #{day}, #{year}"
  end

  def display_time
    time.strftime("%l:%M %P").lstrip if time
  end
end

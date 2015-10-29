class Meeting < ActiveRecord::Base
  has_many :talks
  has_many :speakers, through: :talks
  
  validates_presence_of :date

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }

  def display_date
    datetime = date.to_datetime
    weekday = DateTime::DAYNAMES[datetime.cwday == 7 ? 0 : datetime.cwday]
    month = DateTime::MONTHNAMES[datetime.month]
    day = datetime.day
    year = datetime.year

    "#{weekday}, #{month} #{day}, #{year}"
  end

  def time
    datetime = date.to_datetime
    datetime.strftime('%l:%M %P').lstrip
  end
end

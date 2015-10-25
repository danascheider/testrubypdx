class Meeting < ActiveRecord::Base
  validates_presence_of :date

  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }

  def display_date
    datetime = date.to_datetime
    weekday = DateTime::DAYNAMES[datetime.cwday]
    month = DateTime::MONTHNAMES[datetime.month]
    day = datetime.day
    year = datetime.year

    "#{weekday}, #{month} #{day}, #{year}"
  end
end

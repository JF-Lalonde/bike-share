class AllDate < ActiveRecord::Base
  has_many :start_dates
  has_many :end_dates
  has_many :conditions
  validates :todays_date, presence: true

  def start_dates
    StartDate.find_by(date_id: self.id)
  end

  def end_dates
    EndDate.find_by(date_id: self.id)
  end

  def start_trips
    day = self.id
    start_day = StartDate.find_by(date_id: day)
    start_day.trips
  end

  def end_trips
    day = self.id
    end_day = EndDate.find_by(date_id: day)
    end_day.trips
  end
end

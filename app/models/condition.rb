class Condition < ActiveRecord::Base
  belongs_to :all_date
  validates :this_date, presence: true
  validates :max_temperature_f, presence: true
  validates :mean_temperature_f, presence: true
  validates :min_temperature_f, presence: true
  validates :mean_humidity, presence: true
  validates :mean_visibility_miles, presence: true
  validates :mean_wind_speed_mph, presence: true
  validates :precipitation_inches, presence: true

  def self.per_page
    30
  end

  def self.list_conditions(start, stop)
    range = [*start..stop].uniq
    conditions = Condition.where(max_temperature_f: range).order('max_temperature_f ASC')
    array = conditions.map do |condition|
      condition.start_trips.count
    end
  end

  def self.max_rides
    list_conditions(start, stop).max
  end

  def self.min_rides(start, stop)
    list_conditions(start, stop).min
  end

  def self.avg_rides(start, stop)
    (list_conditions(start, stop).reduce(:+)/
    list_conditions(start, stop).count)
  end

  def all_date
    AllDate.find(self.date_id)
  end

  def start_trips
    all_date.start_trips
  end

  def end_trips
    all_date.end_trips
  end
end

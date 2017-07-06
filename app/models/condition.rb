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
    Condition.where(max_temperature_f: start..stop).order('max_temperature_f ASC')
  end
end

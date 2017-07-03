class Station < ActiveRecord::Base
  belongs_to :city
  validates :name, presence: true
  validates :city_id, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
  validates :name, uniqueness: true



  def self.avg_bikes_per_station
    (Station.average(:dock_count).to_f).round(0)
  end

  def self.most_bikes
    (Station.pluck(:dock_count).max)
  end

  def self.stations_with_most_bikes
    (Station.where(dock_count: most_bikes))
  end

  def self.least_bikes
    (Station.pluck(:dock_count).min)
  end

  def self.stations_with_least_bikes
    (Station.where(dock_count: least_bikes))
  end

  def self.newest_station_date
    (Station.pluck(:installation_date).max)
  end

  def self.newest_station
    (Station.where(installation_date: newest_station_date))
  end

  def self.oldest_station_date
    (Station.pluck(:installation_date).min)
  end

  def self.oldest_station
    (Station.where(installation_date: oldest_station_date))
  end

end

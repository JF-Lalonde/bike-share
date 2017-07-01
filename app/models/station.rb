class Station < ActiveRecord::Base
  belongs_to :city
  validates :name, presence: true
  validates :city, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
  validates :name, uniqueness: true



  def avg_bikes_per_station
    (Station.average(:dock_count).to_f).round(0)
  end

  def most_bikes
    (Station.pluck(:dock_count).max)
  end

  def stations_with_most_bikes
    (Station.where(dock_count: most_bikes))
  end

  def least_bikes
    (Station.pluck(:dock_count).min)
  end

  def stations_with_least_bikes
    (Station.where(dock_count: least_bikes))
  end

  def newest_station_date
    (Station.pluck(:installation_date).max)
  end

  def newest_station
    (Station.where(installation_date: newest_station_date))
  end

  def oldest_station_date
    (Station.pluck(:installation_date).min)
  end

  def oldest_station
    (Station.where(installation_date: oldest_station_date))
  end

end

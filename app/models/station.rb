require './app/models/start_station.rb'
require './app/models/end_station.rb'
require './app/models/trip.rb'

class Station < ActiveRecord::Base
  has_many :trips
  has_many :start_stations
  has_many :end_stations
  belongs_to :city
  validates :name, presence: true
  validates :city_id, presence: true
  validates :dock_count, presence: true
  validates :installation_date, presence: true
  validates :name, uniqueness: true

  def start_trips
    station = StartStation.find_by(station_id: self.id)
    station.trips
  end

  def end_trips
    station = EndStation.find_by(station_id: self.id)
    station.trips
  end

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

  def self.validate_name_change(name)
    if equivalent_names[name]
      equivalent_names[name]
    else
      name
    end
  end

  def self.equivalent_names
    {
      "San Jose Government Center"=>"Santa Clara County Civic Center",
      "Broadway at Main" =>"Stanford in Redwood City",
      "Post at Kearny" => "Post at Kearney",
      "Washington at Kearny" => "Washington at Kearney"
    }
  end

  def rides_started
    start_trips.count
  end

  def rides_ended
    end_trips.count
  end

  def most_popular_destination
    station = Station.first.start_trips
    station.group(:end_station).order("count_id DESC").count(:id).keys.first.station
  end

  def most_popular_origins
    station = Station.first.end_trips
    station.group(:start_station).order("count_id DESC").count(:id).keys.first.station
  end

  def most_popular_departure_date
    station = Station.first.start_trips
    station.group(:start_date).order("count_id DESC").count(:id).keys.first
  end

  def most_frequent_zipcode
    station = Station.first.start_trips
    station.group(:zip_code).order("count_id DESC").count(:id).keys.first
  end

  def most_frequent_zipcode
    station = Station.first.start_trips
      station.group(:bike_id).order("count_id DESC").count(:id).keys.first
  end
end

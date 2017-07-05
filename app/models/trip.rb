require 'will_paginate'
require 'will_paginate/active_record'
require './app/models/station.rb'
require './app/models/start_station.rb'
require './app/models/end_station.rb'
require 'Date'


class Trip < ActiveRecord::Base
  # belongs_to :station
  # belongs_to :start_station
  # belongs_to :end_station
  validates :duration, presence: true
  validates :start_station_name, presence: true
  validates :start_station_id, presence: true
  validates :end_station_name, presence: true
  validates :end_station_id, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :bike_id, presence: true
  validates :subscription_type, presence: true
  validates :zip_code, presence: true

  def start_station
    start = StartStation.find(self.start_station_id)
    start.station
  end

  def end_station
    end_station = EndStation.find(self.end_station_id)
    end_station.station
  end

  def self.per_page
    30
  end

  def self.average_duration_of_a_ride
    (Trip.average(:duration).to_f).round(2)
  end

  def self.longest_ride
    (Trip.pluck(:duration).max)
  end

  def self.shortest_ride
    (Trip.pluck(:duration).min)
  end

  ## Flesh out relationship with station, #possibly same as ridden bikes least and most below
  def self.station_with_most_start_trips
    station_name = (Trip.pluck(:start_station_name).max)
    # Station.find_by(name: station_name).class
  end

  def self.station_with_most_end_trips
    Trip.order(:end_station_name).last.end_station_name
  end

  def self.monthly_rides_breakdown(month, year)
    (Trip.where('extract(month from start_date) =? and extract(year from start_date) =?',month, year)).count
  end

  def self.yearly_rides_breakdown(year)
    (Trip.where('extract(year from start_date) =?', year)).count
  end

  def self.most_ridden_bike
    bike = Trip.group(:bike_id).order("count_id DESC").limit(1).count(:id)
    bike.keys
  end

  def self.least_ridden_bike
    bike = Trip.group(:bike_id).order("count_id ASC").limit(1).count(:id)
    bike.keys
  end

  def self.sub_type_breakdown
    subs = Trip.where(subscription_type: "Subscriber").count
    custs = Trip.where(subscription_type: "Customer").count
    "There are #{subs} number of Subscribers, or #{(subs/(Trip.count.to_f) * 100).round(2)}% of all riders. Conversely, there are #{custs} number of Customers, or #{(custs/(Trip.count.to_f) * 100).round(2)}% of all riders."
  end

  def self.number_of_rides_started_at_this_station(started)

  end

  def self.number_of_rides_ended_at_this_station(ended)
  end

end

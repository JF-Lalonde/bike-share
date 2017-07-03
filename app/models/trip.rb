require 'will_paginate'
require 'will_paginate/active_record'
require './app/models/station.rb'
require 'Date'


class Trip < ActiveRecord::Base
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

  ## Flesh out relationship with station
  def self.station_with_most_start_trips
    station_name = (Trip.pluck(:start_station_name).max)
    # Station.find_by(name: station_name).class
  end

  def self.station_with_most_end_trips
    (Trip.pluck(:end_station_name).max)
  end

  def self.monthly_rides_breakdown(month, year)
    Trip.where('extract(month from start_date) =? and extract(year from start_date) =?',month, year)
  end

end

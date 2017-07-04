require 'will_paginate'
require 'will_paginate/active_record'
require './app/models/station.rb'
require './app/models/start_station.rb'
require './app/models/end_station.rb'
require 'Date'


class Trip < ActiveRecord::Base
  belongs_to :station
  belongs_to :start_station
  delegate :start_station_name, :to => :start_station
  belongs_to :end_station
  delegate :end_station_name, :to => :end_station
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
    self.start_station.station
  end

  def end_station
    self.end_station.station
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

  def self.station_with_most_start_trips
    Station.trips
  end

  def self.station_with_most_end_trips
    Trip.order(:end_station_name).last.end_station_name
  end

  def self.monthly_rides_breakdown(month, year)
    Trip.where('extract(month from start_date) =? and extract(year from start_date) =?',month, year)
  end

  def self.yearly_rides_breakdown(year)
    Trip.where('extract(year from start_date) =?', year)
  end

  def self.most_ridden_bike
    Trip.all.each do |bike|
    bike.trips.count
    end
  end

  def self.sub_type_breakdown
    subs = Trip.where(subscription_type: "Subscriber").count
    custs = Trip.where(subscription_type: "Customer").count
    "There are #{subs} number of Subscribers, or #{(subs/(Trip.count.to_f) * 100).round(2)}% of all riders. Conversely, there are #{custs} number of Customers, or #{(custs/(Trip.count.to_f) * 100).round(2)}% of all riders."
  end
end

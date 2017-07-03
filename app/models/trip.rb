require 'will_paginate'
require 'will_paginate/active_record'

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
  

end

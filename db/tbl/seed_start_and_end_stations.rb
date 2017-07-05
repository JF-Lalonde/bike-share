require 'CSV'
require './app/models/start_station.rb'
require './app/models/end_station.rb'
require 'active_support/core_ext'


class SeedStartAndEndStations

  def self.make_start_station_table
    Station.pluck(:id).each do |id|
      StartStation.create(station_id: id)
    end
  end

  def self.make_end_station_table
    Station.pluck(:id).each do |id|
      EndStation.create(station_id: id)
    end
  end
end

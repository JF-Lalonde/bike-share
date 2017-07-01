require 'CSV'
require './app/models/station.rb'
require './app/models/city.rb'
require 'Date'
require 'active_support/core_ext'

class UpdateCityIdStation

  def self.update_city_id_in_stations
    Station.where(city: "Palo Alto").each do |station|
      station.update_attributes(city_id: City.find_by(name: "Palo Alto").id)
    end

    Station.where(city: "San Francisco").each do |station|
      station.update_attributes(city_id: City.find_by(name: "San Francisco").id)
    end

    Station.where(city: "San Jose").each do |station|
      station.update_attributes(city_id: City.find_by(name: "San Jose").id)
    end

    Station.where(city: "Mountain View").each do |station|
      station.update_attributes(city_id: City.find_by(name: "Mountain View").id)
    end
  end
end

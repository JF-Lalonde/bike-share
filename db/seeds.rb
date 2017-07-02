require './db/tbl/seed_station.rb'
require './db/tbl/seed_city.rb'
require './db/tbl/update_city_station.rb'
require 'CSV'
require 'Date'
require 'active_support/core_ext'


class Seeds

  def reset
    Station.destroy_all
    City.destroy_all
  end

  def seed_full_database
    reset
    seed_stations
    seed_cities
    seed_stations_with_city_id
  end

  def seed_stations
    SeedStation.make_stations_table
  end

  def seed_cities
    SeedCity.create_db_table
  end

  def seed_stations_with_city_id
    UpdateCityIdStation.update_city_id_in_stations
  end
end

a = Seeds.new


puts "station database seeded"

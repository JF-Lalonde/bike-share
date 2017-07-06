# require './db/tbl/seed_station.rb'
# require './db/tbl/seed_city.rb'
# require './db/tbl/update_city_station.rb'
# require './db/tbl/seed_trip.rb'
# require './db/tbl/seed_start_and_end_stations.rb'
# require './db/tbl/station_update_station_ids_in_trips.rb'
require 'require_all'
require_all './db/tbl'
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

  def seed_table_trips
    SeedTrip.seed_trips_table
  end

  def seed_start_and_end_stations_tables
    SeedStartAndEndStations.make_start_station_table
    SeedStartAndEndStations.make_end_station_table
  end

  def update_start_and_end_station_ids_in_trips
    StationUpdateStationIdsInTrips.update_start_station_id_in_trips
    StationUpdateStationIdsInTrips.update_end_station_id_in_trips
  end

  def seed_table_conditions
    SeedCondition.seed_conditions_table
  end

  
end

a = Seeds.new
a.update_start_and_end_station_ids_in_trips

puts "database seeded"

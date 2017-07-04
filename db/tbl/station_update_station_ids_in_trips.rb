require './app/models/trip.rb'
require './app/models/start_station.rb'
require './app/models/end_station.rb'
require './app/models/station.rb'

class StationUpdateStationIdsInTrips

  def self.update_start_station_id_in_trips
    Trip.all.each do |trip|
      a = Station.validate_name_change(trip.start_station_name)
      station_id = Station.find_by(name: a).id
      start_station_id = StartStation.find_by(station_id: station_id).id
      trip.update_attributes(start_station_id: start_station_id)
    end
  end

 def self.update_end_station_id_in_trips
    Trip.all.each do |trip|
      a = Station.validate_name_change(trip.end_station_name)
      station_id = Station.find_by(name: a).id
      end_station_id = EndStation.find_by(station_id: station_id).id
      trip.update_attributes(end_station_id: end_station_id)
    end
  end

end

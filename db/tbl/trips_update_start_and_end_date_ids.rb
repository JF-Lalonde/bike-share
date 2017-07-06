require './app/models/trip.rb'
require './app/models/start_date.rb'
require './app/models/end_date.rb'
require './app/models/all_date.rb'

class TripsUpdateStartandEndDateIDs

  def self.update_start_date_id_in_trips
    start_count = 0
    Trip.all.each do |trip|
      a = trip.start_date
      date_id = AllDate.find_by(todays_date: a).id
      start_date_id = StartDate.find_by(date_id: date_id).id
      trip.update_attributes(start_date_id: start_date_id)
      start_count += 1
      puts start_count
    end
  end

 def self.update_end_date_id_in_trips
   end_count = 0
    Trip.all.each do |trip|
      a = trip.end_date
      date_id = AllDate.find_by(todays_date: a).id
      end_date_id = EndDate.find_by(date_id: date_id).id
      trip.update_attributes(end_date_id: end_date_id)
    end_count += 1
    puts end_count
    end
  end

end

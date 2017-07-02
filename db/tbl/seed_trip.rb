require 'CSV'
require './app/models/trip.rb'
require 'Date'
require 'active_support/core_ext'

class SeedTrip
  def self.clean_zipcode(zip_code)
    zip_code.to_s.rjust(5, "0")[0..4]
  end

  def self.seed_trips_table
    CSV.foreach("./db/csv/trip.csv", headers: true) do |row|
      row.delete("id")
      row[:zip_code] = clean_zipcode(row[:zip_code])
      start_date = row["start_date"]
      end_date = row["end_date"]
      row["start_date"] = Date.strptime(start_date, "%m/%d/%Y")
      row["end_date"] = Date.strptime(end_date, "%m/%d/%Y")
      Trip.create!(row.to_h) unless Trip.exists?(id: row["id"])
    end
  end
end

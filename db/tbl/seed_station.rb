require 'CSV'
require './app/models/station.rb'
require 'Date'
require 'active_support/core_ext'

class SeedStation

  def self.make_stations_table
    CSV.foreach("./db/csv/station.csv", :headers => true) do |row|

     city_name = row["city"]

     date = row["installation_date"]

     row.delete("id")

     row['installation_date'] = Date.strptime(date, '%m/%d/%Y')
      Station.create!(row.to_h) unless Station.exists?(name: row['name'])
    end
  end
end

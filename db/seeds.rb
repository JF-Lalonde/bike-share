require 'CSV'
require './app/models/station.rb'
require './app/models/city.rb'
require 'Date'
require 'active_support/core_ext'


# CSV.foreach("./db/csv/station.csv", :headers => true) do |row|
#
#  city_name = row["city"]
#   date = row["installation_date"]
#
#  row.delete("id")
#
#  row['installation_date'] = Date.strptime(date, '%m/%d/%Y')
#   Station.create!(row.to_h) unless Station.exists?(name: row['name'])
# end
#
# Station.uniq.pluck(:city).each do |city|
#   City.create!(name: city) unless City.exists?(name: row['name'])
# end

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

puts "station database seeded"

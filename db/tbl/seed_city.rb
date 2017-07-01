require 'CSV'
require './app/models/station.rb'
require './app/models/city.rb'
require 'Date'
require 'active_support/core_ext'


class SeedCity

  def self.create_db_table
    Station.uniq.pluck(:city).each do |city|
      City.create!(name: city) unless City.exists?(name: city['name'])
    end
  end
end

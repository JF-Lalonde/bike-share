require './app/models/condition.rb'
require './app/models/all_date.rb'
require './app/models/end_date.rb'
require './app/models/start_date.rb'
require './app/models/trip.rb'
require 'Date'
require 'active_support/core_ext'

class SeedDates

  def self.seed_table_date
    counter = 0
    Trip.uniq.pluck(:start_date).each do |date|
      AllDate.find_or_create_by!(todays_date: date)
      puts counter += 1
    end

    Trip.uniq.pluck(:end_date).each do |date|
      AllDate.find_or_create_by!(todays_date: date)
      puts counter += 1
    end

    Condition.uniq.pluck(:this_date).each do |date|
      AllDate.find_or_create_by!(todays_date: date)
      puts counter += 1
    end
  end
end

require './app/models/condition.rb'
require './app/models/all_date.rb'
require 'Date'
require 'active_support/core_ext'

class UpdateDateIDandConditions

  def self.seed_date_id_in_conditions
    counter = 0
    Condition.all.each do |condition|
      date_id = AllDate.find_by(todays_date: condition.this_date).id
      condition.update_attributes(date_id: date_id)
      puts counter += 1
    end
  end
end

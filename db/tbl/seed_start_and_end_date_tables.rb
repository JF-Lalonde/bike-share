require './app/models/start_date.rb'
require './app/models/end_date.rb'
require 'active_support/core_ext'


class SeedStartAndEndDateTables

  def self.make_start_date_table
    AllDate.pluck(:id).each do |id|
      StartDate.create(date_id: id)
    end
  end

  def self.make_end_date_table
    AllDate.pluck(:id).each do |id|
      EndDate.create(date_id: id)
    end
  end
end

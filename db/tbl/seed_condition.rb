require 'CSV'
require './app/models/condition.rb'
require 'Date'
require 'active_support/core_ext'

class SeedCondition
  def self.clean_zipcode(zip_code)
    zip_code.to_s.rjust(5, "0")[0..4]
  end

  def self.clean_events(events)
    if events.nil?
      events = "N/A"
    end
  end

  def self.seed_conditions_table
    CSV.foreach("./db/csv/weather.csv", headers: true) do |row|
      row.delete("id")
      row["zip_code"] = clean_zipcode(row["zip_code"])
      # row["events"] = clean_events(row["events"])
      start_date = row["start_date"]
      end_date = row["end_date"]
      row["date"] = Date.strptime(date, "%m/%d/%Y")
      reader = row
      reader = reader.delete["date"]
      Condition.create!(reader.to_h)
    end
  end
end

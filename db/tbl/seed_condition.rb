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

  def self.clean_measurements(measurement)
    if measurement.nil?
      measurement = 0.0
    end
    measurement
  end

  def self.seed_conditions_table
    CSV.foreach("./db/csv/weather.csv", headers: true) do |row|
      row.delete("id")
      row["zip_code"] = clean_zipcode(row["zip_code"])
      row["events"] = clean_events(row["events"])
      row["max_gust_speed_mph"] = clean_measurements(row["max_gust_speed_mph"])
      row["max_temperature_f"] = clean_measurements(row["max_temperature_f"])
      row["mean_temperature_f"] = clean_measurements(row["mean_temperature_f"])
      row["min_temperature_f"] = clean_measurements(row["min_temperature_f"])
      row["max_dew_point_f"] = clean_measurements(row["max_dew_point_f"])
      row["mean_dew_point_f"] = clean_measurements(row["mean_dew_point_f"])
      row["min_dew_point_f"] = clean_measurements(row["min_dew_point_f"])
      row["max_humidity"] = clean_measurements(row["max_humidity"])
      row["mean_humidity"] = clean_measurements(row["mean_humidity"])
      row["min_humidity"] = clean_measurements(row["min_humidity"])
      row["max_sea_level_pressure_inches"] = clean_measurements(row["max_sea_level_pressure_inches"])
      row["mean_sea_level_pressure_inches"] = clean_measurements(row["mean_sea_level_pressure_inches"])
      row["min_sea_level_pressure_inches"] = clean_measurements(row["min_sea_level_pressure_inches"])
      row["max_visibility_miles"] = clean_measurements(row["max_visibility_miles"])
      row["mean_visibility_miles"] = clean_measurements(row["mean_visibility_miles"])
      row["min_visibility_miles"] = clean_measurements(row["min_visibility_miles"])
      row["max_wind_Speed_mph"] = clean_measurements(row["max_wind_Speed_mph"])
      row["mean_wind_speed_mph"] = clean_measurements(row["mean_wind_speed_mph"])
      row["precipitation_inches"] = clean_measurements(row["precipitation_inches"])
      row["cloud_cover"] = clean_measurements(row["cloud_cover"])
      row["this_date"] = row["date"]
      row.delete("date")
      date = row["this_date"]
      row["this_date"] = Date.strptime(date, "%m/%d/%Y")
      Condition.create!(row.to_h)
    end
  end
end

class CreateConditionsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :conditions do |t|
      t.date  :this_date
      t.float :max_temperature_f
      t.float :mean_temperature_f
      t.float :min_temperature_f
      t.float :max_dew_point_f
      t.float :mean_dew_point_f
      t.float :min_dew_point_f
      t.float :max_humidity
      t.float :mean_humidity
      t.float :min_humidity
      t.float :max_sea_level_pressure_inches
      t.float :mean_sea_level_pressure_inches
      t.float :min_sea_level_pressure_inches
      t.float :max_visibility_miles
      t.float :mean_visibility_miles
      t.float :min_visibility_miles
      t.float :max_wind_Speed_mph
      t.float :mean_wind_speed_mph
      t.float :max_gust_speed_mph
      t.float :precipitation_inches
      t.float :cloud_cover
      t.string :events
      t.float :wind_dir_degrees
      t.string :zip_code

      t.datetime "created_at",         null: false
      t.datetime "updated_at",         null: false
    end
  end
end

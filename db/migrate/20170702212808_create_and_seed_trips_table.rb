class CreateAndSeedTripsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.integer "duration"
      t.string "start_station_name"
      t.integer "start_station_id"
      t.string "end_station_name"
      t.integer "end_station_id"
      t.date "start_date"
      t.date "end_date"
      t.integer "bike_id"
      t.string "subscription_type"
      t.integer "zip_code"

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end

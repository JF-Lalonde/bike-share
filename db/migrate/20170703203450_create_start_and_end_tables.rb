class CreateStartAndEndTables < ActiveRecord::Migration[5.0]
  def change
    create_table :start_stations do |t|
      t.integer :station_id
    end

    create_table :end_stations do |t|
      t.integer :station_id
    end
  end
end

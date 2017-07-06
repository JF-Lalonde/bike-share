class CreateDatesTables < ActiveRecord::Migration[5.0]
  def change
    create_table :dates do |t|
      t.date :todays_date
    end

    create_table :start_dates do |t|
      t.integer :date_id
    end

    create_table :end_ends do |t|
      t.integer :date_id
    end

    add_column :trips, :start_date_id, :integer

    add_column :trips, :end_date_id, :integer

    add_column :conditions, :date_id, :integer
  end
end

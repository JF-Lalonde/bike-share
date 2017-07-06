class UpdateEndDateName < ActiveRecord::Migration[5.0]
  def change
    rename_table :end_ends, :end_dates
  end
end

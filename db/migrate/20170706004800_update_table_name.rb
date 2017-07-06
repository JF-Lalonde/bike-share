class UpdateTableName < ActiveRecord::Migration[5.0]
  def change
    rename_table :dates, :all_dates
  end
end

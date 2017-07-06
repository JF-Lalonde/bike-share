RSpec.desribe "User generates Trip" do
  it "with valid attributes" do
    visit('/trips/new')
    fill_in("trip[duration]", with: 24)
    fill_in("trip[start_station_name]", with: "Penn")
    fill_in("trip[start_station_id]", with: 1)
    fill_in("trip[end_station_name]", with: "Union")
    fill_in("trip[end_station_id]", with: 2)
    fill_in("trip[start_date]", with: 'Mon, 06 May 2013')
    fill_in("trip[end_date]", with: 'Mon, 06 May 2013')
    fill_in("trip[bike_id]", with: 88)
    fill_in("trip[subscription_type]", with: "Customer")
    fill_in("trip[zip_code]", with: "90210")
  end
end

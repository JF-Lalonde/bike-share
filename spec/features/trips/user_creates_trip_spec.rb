RSpec.describe "When a user visits /trips/new" do
  it "they see a form and can generate a new trip" do

    Station.create(name: "Penn", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")


    visit('/trips/new')
    fill_in("trip[duration]", with: 24)
    fill_in("trip[start_station_name]", with: "Penn")
    # fill_in("trip[start_station_id]", with: 1)
    fill_in("trip[end_station_name]", with: "Union")
    # fill_in("trip[end_station_id]", with: 2)
    fill_in("trip[start_date]", with: 'Mon, 06 May 2013')
    fill_in("trip[end_date]", with: 'Mon, 06 May 2013')
    fill_in("trip[bike_id]", with: 88)
    fill_in("trip[subscription_type]", with: "Customer")
    fill_in("trip[zip_code]", with: "90210")
    old_count = Trip.count

    find("input[type='submit']").click
    new_count = Trip.count
    trip = Trip.last

    expect(current_path).to eq("/trips/#{trip.id}")
    expect(page).to have_content("Union")
    expect(new_count - old_count).to eq(1)
  end
end

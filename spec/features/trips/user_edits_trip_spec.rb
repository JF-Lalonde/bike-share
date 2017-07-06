
RSpec.describe "When a user visits /trips/{:id}/edit" do
  it "they can see an edit option to edit and save changes" do

    trip = Trip.create(duration: 75, start_station_id: 1, end_station_id: 3, bike_id: 7, subscription_type: 'Customer', zip_code: '90210' )

    visit('/trips/1/edit')
    fill_in("trip[duration]", with: 24)
    fill_in("trip[start_station_id]", with: 1)
    fill_in("trip[end_station_id]", with: 2)
    fill_in("trip[bike_id]", with: 88)
    fill_in("trip[subscription_type]", with: "Customer")
    fill_in("trip[zip_code]", with: "90210")

    old_count = Trip.count

    find("input[type='submit']").click
    new_count = Trip.count
    trip = Trip.last

    expect(current_path).to eq("/trips/#{trip.id}")
    # expect(page).to have_content("Union")
    expect(new_count - old_count).to eq(0)
  end
end

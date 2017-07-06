
RSpec.describe "When a user visits /trips" do
  it "they can delete a trip" do
    trip = Trip.create(duration: 75, start_station_id: 1, bike_id: 7, subscription_type: 'Customer', zip_code: '90210' )

    visit('/trips')

    expect(Trip.count).to eq(1)

    expect(Trip.count).to eq(0)
  end

  it "they can delete a trip form /trips/1/edit" do
    trip = Trip.create(duration: 75, start_station_id: 1, end_station_id: 3, bike_id: 7, subscription_type: 'Customer', zip_code: '90210' )

    visit('/trips/1/edit')

    expect(Trip.count).to eq(1)
    click_on('delete')
    expect(Trip.count).to eq(0)
  end

end

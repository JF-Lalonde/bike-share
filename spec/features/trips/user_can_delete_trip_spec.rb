
RSpec.describe "When a user can visits /trips" do
  it "they can delete a trip" do
    trip = Trip.create(duration: 75, start_date: 'Mon, 06 May 2013', end_date: 'Mon, 06 May 2013', start_station_name: 'Penn', start_station_id: 1, end_station_name: 'Union', end_station_id: 3, bike_id: 7, subscription_type: 'Customer', zip_code: '90210' )

    visit('/trips')

    expect(Trip.count).to eq(1)
    click_on("input[value ='delete']")
    expect(Trip.count).to eq(0)
  end
end

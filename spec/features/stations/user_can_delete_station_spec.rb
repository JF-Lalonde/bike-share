RSpec.describe "When a user can visits /stations" do
  it "they can delete a station" do

    Station.create(name: "Penn-Ten Station", city_id: 2, dock_count: 23, installation_date: "2014-08-06 23:36:47")
    visit('/stations')

    expect(Station.count).to eq(1)
    click_on('delete')
    expect(Station.count).to eq(0)
  end
end

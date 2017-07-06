RSpec.describe "When a user can visits /stations" do
  it "they can delete a station" do

    Station.create(name: "Penn-Ten Station", city_id: 2, dock_count: 23, installation_date: "2014-08-06 23:36:47")
    visit('/stations')
    click_on('Edit')

    expect(current_path).to eq('/stations/1/edit')
    expect(page).to have_content('Edit')

  end
end

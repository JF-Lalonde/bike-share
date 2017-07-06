
RSpec.describe "User visits trips" do
  it "and sees dashboard" do
    visit('/trips')

    expect(page).to have_content("Trips")
  end

  it "and clicks on all trips link" do
    visit ('/trips')
    click_link('List of Stations') ## need to review with Mike's styling

    expect(current_path).to eq("/trips")
    expect(page).to have_content("Add Trip")
  end

end

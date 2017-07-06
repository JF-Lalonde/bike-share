
RSpec.describe "When a user visits /trips-dashboard" do
  it "they see dashboard analytics" do
    visit('/trips')

    expect(page).to have_content("Trips")
  end

  it "and clicks on all trips link" do
    visit ('/trips')
    click_link('List of Trips') ## need to review with Mike's styling

    expect(current_path).to eq("/trips")
    expect(page).to have_content("Add Trip")
  end

end

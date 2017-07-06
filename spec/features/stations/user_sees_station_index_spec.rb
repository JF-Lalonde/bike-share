RSpec.describe "User visits '/stations'" do
  it "and clicks the link for new station" do
    visit('/stations')
    click_link('Add Station')

    expect(current_path).to eq("/stations/new")
    expect(page).to have_content('Add station')
  end

  it "and clicks the link to Station Analytics" do
    visit('/stations')
    click_link('Station Analytics')

    expect(current_path).to eq("/station-dashboard")
    expect(page).to have_content('Station Analytics')
  end
end

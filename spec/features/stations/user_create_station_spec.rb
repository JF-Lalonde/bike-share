RSpec.describe "User visits '/stations'" do
  it "and sees the index for stations" do
    visit('/stations')
    click_link('Add Station')

    expect(current_path).to eq("/stations/new")
    expect(page).to have_content('Go Back')
  end
end

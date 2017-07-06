RSpec.describe "User visits '/'" do
  it "and sees dashboard" do
    visit('/')

    expect(page).to have_content("Stations")
  end

  it "and clicks on all stations link" do
    visit ('/')
    click_link('List of Stations')

    expect(current_path).to eq("/stations")
    expect(page).to have_content("Add Station")
  end

end

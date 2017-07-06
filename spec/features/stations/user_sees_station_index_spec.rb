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

  it "and clicks the link to the Home page" do
    visit('/stations')
    click_link('Home')

    expect(current_path).to eq('/')
    expect(page).to have_content('Bike Share')
  end

  it "and clicks on the link to the Edit page" do
    Station.create(name: "Penn-Ten Station", city_id: 2, dock_count: 23, installation_date: "2014-08-06 23:36:47")
    visit('/stations')

    
  end
end

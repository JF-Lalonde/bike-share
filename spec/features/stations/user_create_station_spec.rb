RSpec.describe "User visits '/'" do
  it "and sees dashboard" do
    visit('/')

    expect(page).to have_content("Station")
  end
end

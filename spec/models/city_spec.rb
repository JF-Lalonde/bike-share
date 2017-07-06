RSpec.describe City do
  describe "Validations" do
    it "is valid with name and id" do
      city = City.create(name: "San Francisco")

      expect(city).to be_valid
      expect(city.id).to eq(1)
    end

    it "is not valid without name" do
      city = City.create

      expect(city).to_not be_valid
    end

    it "is not valid with the same name" do
      city_1 = City.create(name: "San Jose")
      city_2 = City.create(name: "San Jose")

      expect(city_1).to be_valid
      expect(city_2).to_not be_valid
    end
  end
end

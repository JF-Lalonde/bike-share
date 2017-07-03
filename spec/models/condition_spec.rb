RSpec.decscribe Condition do
  describe "Validations" do
    it "is valid with date, max & min temps, mean humidity, visibility, wind speed, and precipitation" do
      cond = Condition.create(date: , max_temperature_f: , min_temperature_f: ,
                              mean_temperature_f:, mean_humidity: ,
                              mean_visibility_miles: ,mean_wind_speed_mph: ,
                              precipitation_inches: )

      expect(cond).to be_valid
    end
  end
end

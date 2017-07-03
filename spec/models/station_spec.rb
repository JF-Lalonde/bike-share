require 'Date'

RSpec.describe Station do
  describe "Validations" do

      it "is valid with name, dock count, city and installation date" do
      station = Station.new(name: "Penn Station", dock_count: 32, city_id: 1, installation_date: 'Sat, 08 Jun 2013')

      expect(station).to be_valid
      end

      it "is invalid if missing name" do
        station = Station.new(dock_count: 32, city_id: 1, installation_date: 'Sat, 08 Jun 2013')

        expect(station).to_not be_valid
      end

      it "is invalid if missing dock type" do
        station = Station.new(name: "Jane", city_id: 2, installation_date: 'Sat, 08 Jun 2013')

        expect(station).to_not be_valid
      end

      it "is invalid if created with the same name" do
        station = Station.create(name: "Penn Station", dock_count: 32, city_id: 4, installation_date: 'Sat, 08 Jun 2013')
        station2 = Station.create(name: "Penn Station", dock_count: 34, city_id: 3, installation_date: 'Sat, 08 Jun 2013')

        expect(station2).to_not be_valid
      end
  end

  describe 'Attributes' do
    it "will have a name, dock count, city and installation date" do
      st = Station.new

      expect(st).to respond_to(:name)
      expect(st).to respond_to(:dock_count)
      expect(st).to respond_to(:city_id)
      expect(st).to respond_to(:installation_date)
    end
  end

  describe 'Analytics' do
    it "will return average bikes per station" do
      st = Station.create(name: "Penn Station", dock_count: 32, city_id: 4, installation_date: 'Sat, 08 Jun 2013')
      st_2 = Station.create(name: "Need a gearup", dock_count: 62, city_id: 3, installation_date: 'Sat, 08 Jun 2013')
      avg_sts = Station.avg_bikes_per_station

      expect(avg_sts).to eq(47)
    end

    it "will return the most bikes" do
      st = Station.create(name: "Penn Station", dock_count: 32, city_id: 4, installation_date: 'Sat, 08 Jun 2013')
      st_2 = Station.create(name: "Need a gearup", dock_count: 62, city_id: 3, installation_date: 'Sat, 08 Jun 2013')
      most_bikes = Station.most_bikes

      expect(most_bikes).to eq(62)
    end

    it "will return the station(s) with the most bikes" do
      st = Station.create(name: "Penn Station", dock_count: 32, city_id: 4, installation_date: 'Sat, 08 Jun 2013')
      st_2 = Station.create(name: "Need a gearup", dock_count: 62, city_id: 3, installation_date: 'Sat, 08 Jun 2013')
      result = Station.stations_with_most_bikes

      expect(result[0]).to eq(st_2)
    end
  end
end

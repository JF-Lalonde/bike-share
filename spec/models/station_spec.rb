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

    it "will return the least bikes" do
      st = Station.create(name: "Penn Station", dock_count: 22, city_id: 4, installation_date: 'Sat, 08 Jun 2013')
      st_2 = Station.create(name: "Need a gearup", dock_count: 5, city_id: 3, installation_date: 'Sat, 08 Jun 2013')
      st_3 = Station.create(name: "Crustacean_blue", dock_count: 19, city_id: 3, installation_date: 'Sat, 08 Jun 2013')
      result = Station.least_bikes

      expect(result).to eq(5)
    end

    it "will return the station(s) with the least bikes" do
      st = Station.create(name: "Penn Station", dock_count: 22, city_id: 4, installation_date: 'Sat, 08 Jun 2013')
      st_2 = Station.create(name: "Need a gearup", dock_count: 5, city_id: 3, installation_date: 'Sat, 08 Jun 2013')
      st_3 = Station.create(name: "Crustacean_blue", dock_count: 19, city_id: 3, installation_date: 'Sat, 08 Jun 2013')
      result = Station.stations_with_least_bikes

      expect(result[0]).to eq(st_2)
    end

    it "will return the newest stations date" do
      st = Station.create(name: "Penn Station", dock_count: 22, city_id: 4, installation_date: 'Sat, 08 Jun 2012')
      st_2 = Station.create(name: "Need a gearup", dock_count: 5, city_id: 3, installation_date: 'Sat, 08 Jun 2013')
      st_3 = Station.create(name: "Crustacean_blue", dock_count: 19, city_id: 3, installation_date: 'Sat, 08 Jun 2014')
      result = Station.newest_station_date

      expect(result.class).to eq(Date)
    end

    it "will return the newest station(s)" do
      st = Station.create(name: "Penn Station", dock_count: 22, city_id: 4, installation_date: 'Sat, 08 Jun 2012')
      st_2 = Station.create(name: "Need a gearup", dock_count: 5, city_id: 3, installation_date: 'Sat, 08 Jun 2013')
      st_3 = Station.create(name: "Crustacean_blue", dock_count: 19, city_id: 3, installation_date: 'Sat, 08 Jun 2014')
      result = Station.newest_station

      expect(result[0]).to eq(st_3)
    end

    it "will return the oldest stations date" do
      st = Station.create(name: "Penn Station", dock_count: 22, city_id: 4, installation_date: 'Sat, 08 Jun 2012')
      st_2 = Station.create(name: "Need a gearup", dock_count: 5, city_id: 3, installation_date: 'Sat, 08 Jun 2013')
      st_3 = Station.create(name: "Crustacean_blue", dock_count: 19, city_id: 3, installation_date: 'Sat, 08 Jun 2014')
      result = Station.oldest_station_date

      expect(result.class).to eq(Date)
    end

    it "will return the oldest station(s)" do
      st = Station.create(name: "Penn Station", dock_count: 22, city_id: 4, installation_date: 'Sat, 08 Jun 2012')
      st_2 = Station.create(name: "Need a gearup", dock_count: 5, city_id: 3, installation_date: 'Sat, 08 Jun 2013')
      st_3 = Station.create(name: "Crustacean_blue", dock_count: 19, city_id: 3, installation_date: 'Sat, 08 Jun 2014')
      result = Station.oldest_station

      expect(result[0]).to eq(st)
    end

    it "will validate the name change" do
      st = Station.create(name: "San Jose Government Center", dock_count: 22, city_id: 4, installation_date: 'Sat, 08 Jun 2012')

      result = Station.validate_name_change(st.name)

      expect(result).to eq("Santa Clara County Civic Center")
    end

  end
end

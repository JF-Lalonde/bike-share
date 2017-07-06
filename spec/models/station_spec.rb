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

    it "will validate the name change for necessary stations" do
      st = Station.create(name: "San Jose Government Center", dock_count: 22, city_id: 4, installation_date: 'Sat, 08 Jun 2012')
      st_2 = Station.create(name: "San Diego", dock_count: 22, city_id: 4, installation_date: 'Sat, 08 Jun 2012')

      result = Station.validate_name_change(st.name)
      result_2 = Station.validate_name_change(st_2.name)

      expect(result).to eq("Santa Clara County Civic Center")
      expect(result_2).to eq("San Diego")
    end

    it "will return the amount of started trips for a station" do
      a = Station.create(name: "Penn", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      b = Station.create(name: "Union", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      StartStation.create(station_id: 1)
      StartStation.create(station_id: 2)
      trip = Trip.create(duration: 35, start_station_id: 1, end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')
      trip_2 = Trip.create(duration: 1175,  start_station_id: 2, end_station_id: 1, bike_id: 2, subscription_type: 'Customer', zip_code: '90210')
      trip_3 = Trip.create(duration: 235, start_station_id: 1, end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')

      result = a.rides_started
      result_2 = b.rides_started

      expect(result).to eq(2)
      expect(result_2).to eq(1)
    end

    it "will return the amount of ended trips for a station" do
      a = Station.create(name: "Penn", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      b = Station.create(name: "Union", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      EndStation.create(station_id: 1)
      EndStation.create(station_id: 2)
      trip = Trip.create(duration: 35, start_station_id: 1, end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')
      trip_2 = Trip.create(duration: 1175,  start_station_id: 2, end_station_id: 1, bike_id: 2, subscription_type: 'Customer', zip_code: '90210')
      trip_3 = Trip.create(duration: 235, start_station_id: 1, end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')

      result = a.rides_ended
      result_2 = b.rides_ended

      expect(result).to eq(1)
      expect(result_2).to eq(2)
    end

    it "will return the most popular destination station" do
      a = Station.create(name: "Penn", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      b = Station.create(name: "Union", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      StartStation.create(station_id: 1)
      StartStation.create(station_id: 2)
      EndStation.create(station_id: 1)
      EndStation.create(station_id: 2)


      trip = Trip.create(duration: 35, start_station_id: 1,  end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')
      trip_2 = Trip.create(duration: 1175,  start_station_id: 2, end_station_id: 1, bike_id: 2, subscription_type: 'Customer', zip_code: '90210')
      trip_3 = Trip.create(duration: 235, start_station_id: 1,  end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')

      result = a.most_popular_destination
      result_2 = b.most_popular_destination

      expect(result.name).to eq("Union")
      expect(result_2.name).to eq("Penn")
    end

    it "will return the most popular origin station" do
      a = Station.create(name: "Penn", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      b = Station.create(name: "Union", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      StartStation.create(station_id: 1)
      StartStation.create(station_id: 2)
      EndStation.create(station_id: 1)
      EndStation.create(station_id: 2)


      trip = Trip.create(duration: 35, start_station_id: 1,  end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')
      trip_2 = Trip.create(duration: 1175,  start_station_id: 2, end_station_id: 1, bike_id: 2, subscription_type: 'Customer', zip_code: '90210')
      trip_3 = Trip.create(duration: 235, start_station_id: 1,  end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')

      result = a.most_popular_origins
      result_2 = b.most_popular_origins

      expect(result.name).to eq("Union")
      expect(result_2.name).to eq("Penn")
    end

    it "will return most popular departure date" do
      a = Station.create(name: "Penn", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      b = Station.create(name: "Union", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      StartStation.create(station_id: 1)
      StartStation.create(station_id: 2)
      EndStation.create(station_id: 1)
      EndStation.create(station_id: 2)
      AllDate.create(todays_date: "Wed, 08 May 2013")
      AllDate.create(todays_date: "Thurs, 09 May 2013")
      StartDate.create(date_id: 1)
      EndDate.create(date_id: 1)
      StartDate.create(date_id: 2)
      EndDate.create(date_id: 2)

      trip = Trip.create(duration: 35, start_station_id: 1, end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210', start_date_id: 1, end_date_id: 2)
      trip_2 = Trip.create(duration: 1175, start_station_id: 1, end_station_id: 2, bike_id: 2, subscription_type: 'Customer', zip_code: '90210', start_date_id: 2, end_date_id: 1)
      trip_3 = Trip.create(duration: 235, start_station_id: 1, end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210', start_date_id: 1, end_date_id: 1)

      result = a.most_popular_departure_date

      expect(result.todays_date.to_s).to eq('2013-05-08')
    end

    it "will return the most frequent zipcode" do
      a = Station.create(name: "Penn", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      b = Station.create(name: "Union", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      StartStation.create(station_id: 1)
      StartStation.create(station_id: 2)
      EndStation.create(station_id: 1)
      EndStation.create(station_id: 2)


      trip = Trip.create(duration: 35, start_station_id: 1, end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')
      trip_2 = Trip.create(duration: 1175, start_station_id: 1, end_station_id: 2, bike_id: 2, subscription_type: 'Customer', zip_code: '90210')
      trip_3 = Trip.create(duration: 235, start_station_id: 1, end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90211')

      result = a.most_frequent_zipcode

      expect(result).to eq('90210')
    end


  end
end

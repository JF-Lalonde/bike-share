require 'Date'

RSpec.describe Trip do
  describe "Validations" do

    it "is valid with duration, start station ID, end station ID, bike ID, subscription type, zip code" do
    trip = Trip.new(duration: 75,    start_station_id: 1,  end_station_id: 3, bike_id: 7, subscription_type: 'Customer', zip_code: '90210' )

    expect(trip).to be_valid
    end

    it "is invalid if missing duration"  do
    trip = Trip.new(   start_station_id: 1,  end_station_id: 3, bike_id: 7, subscription_type: 'Customer', zip_code: '90210' )

    expect(trip).to_not be_valid
    end

    it "is invalid if missing ID" do
    trip = Trip.new(duration: 75,     end_station_id: 3, bike_id: 7, subscription_type: 'Customer', zip_code: '90210' )

    expect(trip).to_not be_valid
    end

    it "is invalid if missing ID" do
    trip = Trip.new(duration: 75,    start_station_id: 1,  bike_id: 7, subscription_type: 'Customer', zip_code: '90210' )

    expect(trip).to_not be_valid
    end

    it "is invalid if missing bike ID" do
    trip = Trip.new(duration: 75,    start_station_id: 1,  end_station_id: 3,  subscription_type: 'Customer', zip_code: '90210' )

    expect(trip).to_not be_valid
    end

    it "is invalide if missing subscription type" do
    trip = Trip.new(duration: 75,    start_station_id: 1,  end_station_id: 3, bike_id: 7,  zip_code: '90210' )

    expect(trip).to_not be_valid
    end

    it "is invalid if missing zip code" do
    trip = Trip.new(duration: 75,    start_station_id: 1,  end_station_id: 3, bike_id: 7, subscription_type: 'Customer' )

    expect(trip).to_not be_valid
    end
  end

  describe 'Attributes' do
    it "will have duration, start station ID, end station ID, bike ID, subscription type, zip code" do
      trip = Trip.new

      expect(trip).to respond_to(:duration)
      expect(trip).to respond_to(:start_station_id)
      expect(trip).to respond_to(:end_station_id)
      expect(trip).to respond_to(:bike_id)
      expect(trip).to respond_to(:subscription_type)
      expect(trip).to respond_to(:zip_code)
    end

  end

  describe 'Analytics' do
    it "will return average duration of trips" do
      trip = Trip.create(duration: 75,    start_station_id: 1,  end_station_id: 3, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')
      trip_2 = Trip.create(duration: 175,    start_station_id: 1,  end_station_id: 3, bike_id: 2, subscription_type: 'Customer', zip_code: '90210')
      avg_trip_duration = Trip.average_duration_of_a_ride

      expect(avg_trip_duration).to eq(125)
    end

    it "will return the longest ride" do
      trip = Trip.create(duration: 75,    start_station_id: 1,  end_station_id: 3, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')
      trip_2 = Trip.create(duration: 175,    start_station_id: 1,  end_station_id: 3, bike_id: 2, subscription_type: 'Customer', zip_code: '90210')
      longest_trip = Trip.longest_ride

      expect(longest_trip).to eq(175)
    end

    it "will return the shortest ride" do
      trip = Trip.create(duration: 35,    start_station_id: 1,  end_station_id: 3, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')
      trip_2 = Trip.create(duration: 1175,    start_station_id: 1,  end_station_id: 3, bike_id: 2, subscription_type: 'Customer', zip_code: '90210')
      shortest_trip = Trip.shortest_ride

      expect(shortest_trip).to eq(35)
    end

    it "will return the station with the most start trips" do
      Station.create(name: "Penn", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      Station.create(name: "Union", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      StartStation.create(station_id: 1)
      StartStation.create(station_id: 2)
      trip = Trip.create(duration: 35,    start_station_id: 1,  end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')
      trip_2 = Trip.create(duration: 1175,   start_station_id: 2, end_station_id: 1, bike_id: 2, subscription_type: 'Customer', zip_code: '90210')
      trip_3 = Trip.create(duration: 235,    start_station_id: 1,  end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')

      result = Trip.station_with_most_start_trips

      expect(result.name).to eq("Penn")
    end

    it "will return the station with the most end trips" do
      Station.create(name: "Penn", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      Station.create(name: "Union", city_id: 1, dock_count: 5, installation_date: "Mon, 06 May 2013")
      EndStation.create(station_id: 1)
      EndStation.create(station_id: 2)
      trip = Trip.create(duration: 35,    start_station_id: 1,  end_station_id: 2, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')
      trip_2 = Trip.create(duration: 1175,   start_station_id: 2, end_station_id: 1, bike_id: 2, subscription_type: 'Customer', zip_code: '90210')
      trip_3 = Trip.create(duration: 235,    start_station_id: 1, end_station_id: 1, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')

      result = Trip.station_with_most_end_trips

      expect(result.name).to eq("Penn")
    end

    it "will return the most ridden bike and least ridden bike for all trips" do
      trip = Trip.create(duration: 35,    start_station_id: 1,  end_station_id: 3, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')
      trip_2 = Trip.create(duration: 1175,    start_station_id: 1,  end_station_id: 3, bike_id: 2, subscription_type: 'Subscriber', zip_code: '90210')
      trip_3 = Trip.create(duration: 235,    start_station_id: 1,  end_station_id: 3, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')

      bike_most_usage  = Trip.most_ridden_bike.keys
      bike_least_usage = Trip.least_ridden_bike.keys

      expect(bike_most_usage).to eq([7])
      expect(bike_least_usage).to eq([2])
    end

    it "will return subscription type breakdown" do
      trip = Trip.create(duration: 35,    start_station_id: 1,  end_station_id: 3, bike_id: 7, subscription_type: 'Customer', zip_code: '90210')
      trip_2 = Trip.create(duration: 1175,    start_station_id: 1,  end_station_id: 3, bike_id: 2, subscription_type: 'Subscriber', zip_code: '90210')

      subscriber_type  = Trip.sub_type_breakdown

      expect(subscriber_type).to eq("There are 1 number of Subscribers, or 50.0% of all riders. Conversely, there are 1 number of Customers, or 50.0% of all riders.")
    end
  end
end

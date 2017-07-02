
class BikeShareApp < Sinatra::Base

  get "/" do
    erb :dashboard
  end

  get "/stations" do
    @stations = Station.all
    erb :"stations/index"
  end

  get "/stations/new" do
    erb :"stations/new"
  end

  post "/stations" do
    station = Station.new(params[:station])
    station.save
    redirect "/stations"
  end

  get "/stations/:id" do
    @station = Station.find(params[:id].to_i)
    erb :"/stations/show"
  end

  get "/stations/:id/edit" do
    @station = Station.find(params[:id].to_i)
    erb :"stations/edit"
  end

  put "/stations/:id" do |id|
    Station.update(id.to_i, params[:station])
    redirect "/stations/#{id}"
  end

  delete "/stations/:id" do
    Station.destroy(params[:id].to_i)
    redirect "/stations"
  end

  get "/station-dashboard" do
    @station = Station.all
    erb :"stations/dashboard"
  end

  get "/trips" do
    @trips = Trip.all
    erb :"trips/index"
  end

  get "/trips/new" do
    erb :new
  end

  post "/trips" do
    trip = Trip.new(params[:trip])
    trip.save
    redirect "/trips"
  end

  get "/trip/:id" do
    @trip = Trip.find(params[:id].to_i)
    erb :"trip/show"
  end

  get "/trip/:id/edit" do
    @trip = Trip.find(params[:id].to_i)
    erb :"trip/edit"
  end

  put "trip/:id" do |id|
    Trip.update(id.to_i, params[:trip])
    redirect "/trip/#{id}"
  end

  delete "trip/:id" do
    Trip.destroy(params[:id].to_i)
    redirect "/trips"
  end

end

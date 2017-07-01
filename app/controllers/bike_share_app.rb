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

  get "/stations/:id" do |id|
    Station.find(params[:id].to_i)
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

end

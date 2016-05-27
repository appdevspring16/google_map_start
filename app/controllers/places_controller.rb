class PlacesController < ApplicationController

  def address_to_geo(address)
    require 'open-uri'
    url = 'http://maps.googleapis.com/maps/api/geocode/json?address=' + URI.encode(address)
    parsed_data = JSON.parse(open(url).read)
    lat = parsed_data["results"][0]["geometry"]["location"]["lat"]
    lng = parsed_data["results"][0]["geometry"]["location"]["lng"]
    return [lat,lng]
  end

  def index
    @places = Place.all
  end

  def index_map
    @places = Place.all
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @place = Place.new
  end
  
  def create
    @place = Place.new
    @place.address = params[:address]
    @place.name = params[:name]
    @place.description = params[:description]
    @place.color = ["blue", "red", "purple", "yellow", "green"].sample

    latlng = address_to_geo(params[:address])
    @place.lat = latlng[0]
    @place.lng = latlng[1]

    if @place.save
      redirect_to "/places", :notice => "Place created successfully."
    else
      render 'new'
    end
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])

    @place.address = params[:address]
    @place.lat = params[:lat]
    @place.lng = params[:lng]
    @place.name = params[:name]
    @place.description = params[:description]

    if @place.save
      redirect_to "/places", :notice => "Place updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @place = Place.find(params[:id])

    @place.destroy

    redirect_to "/places", :notice => "Place deleted."
  end
end

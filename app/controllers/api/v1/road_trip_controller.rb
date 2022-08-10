class Api::V1::RoadTripController < ApplicationController
  def create
    drive_time = MapQuestFacade.find_drive_time(params[:origin],params[:destination])
    coordinates = MapQuestFacade.find_coordinates(params[:destination])
    weather = ForecastFacade.find_forecast_for_roadtrip(coordinates)
    road_trip = RoadTrip.new(params[:origin], params[:destination], drive_time, weather)


    render json: RoadTripSerializer.serialize(road_trip), status: 200

  end

end

require 'rails_helper'
RSpec.describe RoadTrip do
  it "has attributes" do
    VCR.use_cassette("road_trip_poros") do
      drive_time = MapQuestFacade.find_drive_time("Seattle,WA","Miami,FL")
      coordinates = MapQuestFacade.find_coordinates("Miami,FL")
      weather = ForecastFacade.find_forecast_for_roadtrip(coordinates)
      road_trip = RoadTrip.new("Seattle,WA", "Miami,FL", drive_time, weather)

      expect(road_trip.end_city).to eq("Miami,FL")
      expect(road_trip.start_city).to eq("Seattle,WA")
      expect(road_trip.travel_time).to eq("47:41:29")
      expect(road_trip.weather_at_eta[:temperature]).to eq(86.2)
      expect(road_trip.weather_at_eta[:conditions]).to eq("overcast clouds")
    end
  end
end

require 'rails_helper'

RSpec.describe ForecastFacade do
  it 'returns prescribed json' do
    VCR.use_cassette("forecast_facade") do
    	forecast = ForecastFacade.find_forecast({lat: -20, lng:40})

    	expect(forecast).to be_a(Hash)
    	expect(forecast[:current_weather]).to be_an_instance_of(CurrentWeather)
    	expect(forecast[:current_weather].conditions).to be_a(String)
      expect(forecast[:current_weather].sunrise).to be_a(Time)
      expect(forecast[:current_weather].sunset).to be_a(Time)
      expect(forecast[:current_weather].temperature).to be_a(Float)
      expect(forecast[:current_weather].feels_like).to be_a(Float)
      expect(forecast[:current_weather].humidity).to be_a(Integer)
      expect(forecast[:current_weather].uvi).to be_a(Float)
      expect(forecast[:current_weather].visibility).to be_a(Integer)
      expect(forecast[:current_weather].conditions).to be_a(String)
      expect(forecast[:current_weather].icon).to be_a(String)

    	expect(forecast[:daily_weather][0]).to be_an_instance_of(DailyWeather)
    	expect(forecast[:daily_weather].length).to eq(5)
    	expect(forecast[:daily_weather][0].date).to be_a(String)
    	expect(forecast[:daily_weather][0].sunrise).to be_a(Time)
    	expect(forecast[:daily_weather][0].sunset).to be_a(Time)
    	expect(forecast[:daily_weather][0].max_temp).to be_a(Float)
    	expect(forecast[:daily_weather][0].min_temp).to be_a(Float)

      expect(forecast[:hourly_weather][0]).to be_an_instance_of(HourlyWeather)
      expect(forecast[:hourly_weather].count).to eq(8)
      expect(forecast[:hourly_weather][0].time).to be_a(Time)
      expect(forecast[:hourly_weather][0].temperature).to be_a(Float)
      expect(forecast[:hourly_weather][0].conditions).to be_a(String)
      expect(forecast[:hourly_weather][0].icon).to be_a(String)
    end
  end
  it 'returns more data for a roadtrip' do
    VCR.use_cassette("forecast_for_road_trip_facade") do
    	forecast = ForecastFacade.find_forecast_for_roadtrip({lat: -20, lng:40})

    	expect(forecast).to be_a(Hash)
    	expect(forecast[:current_weather]).to be_an_instance_of(CurrentWeather)
    	expect(forecast[:current_weather].conditions).to be_a(String)
      expect(forecast[:current_weather].sunrise).to be_a(Time)
      expect(forecast[:current_weather].sunset).to be_a(Time)
      expect(forecast[:current_weather].temperature).to be_a(Float)
      expect(forecast[:current_weather].feels_like).to be_a(Float)
      expect(forecast[:current_weather].humidity).to be_a(Integer)
      expect(forecast[:current_weather].uvi).to be_a(Float)
      expect(forecast[:current_weather].visibility).to be_a(Integer)
      expect(forecast[:current_weather].conditions).to be_a(String)
      expect(forecast[:current_weather].icon).to be_a(String)

    	expect(forecast[:daily_weather][0]).to be_an_instance_of(DailyWeather)
    	expect(forecast[:daily_weather].length).to eq(8)
    	expect(forecast[:daily_weather][0].date).to be_a(String)
    	expect(forecast[:daily_weather][0].sunrise).to be_a(Time)
    	expect(forecast[:daily_weather][0].sunset).to be_a(Time)
    	expect(forecast[:daily_weather][0].max_temp).to be_a(Float)
    	expect(forecast[:daily_weather][0].min_temp).to be_a(Float)

      expect(forecast[:hourly_weather][0]).to be_an_instance_of(HourlyWeather)
      expect(forecast[:hourly_weather].count).to eq(48)
      expect(forecast[:hourly_weather][0].time).to be_a(Time)
      expect(forecast[:hourly_weather][0].temperature).to be_a(Float)
      expect(forecast[:hourly_weather][0].conditions).to be_a(String)
      expect(forecast[:hourly_weather][0].icon).to be_a(String)
    end
  end
end

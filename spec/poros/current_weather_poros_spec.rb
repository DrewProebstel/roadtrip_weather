require 'rails_helper'
RSpec.describe CurrentWeather do
  it "has attributes" do
  data = {
   :dt=>1659935190,
   :sunrise=>1659930376,
   :sunset=>1659971109,
   :temp=>73.31,
   :feels_like=>73.49,
   :pressure=>1019,
   :humidity=>67,
   :dew_point=>61.7,
   :uvi=>0.73,
   :clouds=>0,
   :visibility=>10000,
   :wind_speed=>11.99,
   :wind_deg=>154,
   :wind_gust=>11.88,
   :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}]
  }

  weather = CurrentWeather.new(data)

  expect(weather.datetime).to eq('Sun Aug  7 22:06:30 2022')
  expect(weather.sunrise).to eq('2022-08-07 20:46:16 -0700')
  expect(weather.sunset).to eq('2022-08-08 08:05:09 -0700')
  expect(weather.temperature).to eq(73.31)
  expect(weather.feels_like).to eq(73.49)
  expect(weather.humidity).to eq(67)
  expect(weather.uvi).to eq(0.73)
  expect(weather.visibility).to eq(10000)
  expect(weather.conditions).to eq('clear sky')
  expect(weather.icon).to eq('01d')
  end
end

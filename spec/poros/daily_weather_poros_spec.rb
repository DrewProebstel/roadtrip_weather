require 'rails_helper'
RSpec.describe DailyWeather do
  it "has attributes" do
    data = {:dt=>1660294800,
 :sunrise=>1660275835,
 :sunset=>1660316785,
 :moonrise=>1660318740,
 :moonset=>1660277160,
 :moon_phase=>0.5,
 :temp=>{:day=>75.16, :min=>74.19, :max=>75.94, :night=>75.94, :eve=>75.74, :morn=>74.26},
 :feels_like=>{:day=>75.72, :night=>76.57, :eve=>76.35, :morn=>74.73},
 :pressure=>1019,
 :humidity=>71,
 :dew_point=>65.35,
 :wind_speed=>13.82,
 :wind_deg=>97,
 :wind_gust=>13.2,
 :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
 :clouds=>0,
 :pop=>0,
 :uvi=>8.75}

  weather = DailyWeather.new(data)

  expect(weather.date).to eq('Fri Aug 12 02:00:00 2022')
  expect(weather.max_temp).to eq(75.94)
  expect(weather.min_temp).to eq(74.19)
  expect(weather.sunrise).to eq("2022-08-11 20:43:55 -0700")
  expect(weather.sunset).to eq("2022-08-12 08:06:25 -0700")
  expect(weather.conditions).to eq('clear sky')
  expect(weather.icon).to eq('01d')
  end
end

require 'rails_helper'
RSpec.describe HourlyWeather do
  it "has attributes" do
    data = {:dt=>1659945600,
   :temp=>73.67,
   :feels_like=>73.94,
   :pressure=>1020,
   :humidity=>68,
   :dew_point=>62.46,
   :uvi=>6.72,
   :clouds=>0,
   :visibility=>10000,
   :wind_speed=>9.37,
   :wind_deg=>127,
   :wind_gust=>9.62,
   :weather=>[{:id=>800, :main=>"Clear", :description=>"clear sky", :icon=>"01d"}],
   :pop=>0}

   weather = HourlyWeather.new(data)

   expect(weather.temperature).to eq(73.67)
   expect(weather.time).to eq("2022-08-08 01:00:00 -0700")
 end
end

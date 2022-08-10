class ForecastFacade
  def self.find_forecast(coordinates)
  	data = ForecastService.get_forecast(coordinates[:lat],coordinates[:lng])
    current_weather = CurrentWeather.new(data[:current])
    daily_weather = data[:daily][0..4].map do |daily|
      DailyWeather.new(daily)
    end
    hourly_weather = data[:hourly][0..7].map do |hourly|
      HourlyWeather.new(hourly)
    end
    {current_weather: current_weather, daily_weather: daily_weather, hourly_weather: hourly_weather}
  end

  def self.find_forecast_for_roadtrip(coordinates)
    data = ForecastService.get_forecast(coordinates[:lat],coordinates[:lng])
    current_weather = CurrentWeather.new(data[:current])
    daily_weather = data[:daily].map do |daily|
      DailyWeather.new(daily)
    end
    hourly_weather = data[:hourly].map do |hourly|
      HourlyWeather.new(hourly)
    end
    {current_weather: current_weather, daily_weather: daily_weather, hourly_weather: hourly_weather}
  end
end

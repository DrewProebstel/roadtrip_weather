class RoadTrip
  attr_reader :start_city, :end_city, :travel_time, :weather_at_eta
  def initialize(origin,destination,drive_time, weather)
    @start_city = origin
    @end_city = destination
    @travel_time = seconds_to_time(drive_time)
    @weather_at_eta= find_weather_by_seconds(drive_time,weather)
  end

  def seconds_to_time(seconds)
    [seconds / 3600, seconds / 60 % 60, seconds % 60].map { |t| t.to_s.rjust(2,'0') }.join(':')
  end

  def find_weather_by_seconds(seconds,weather)
    hours = (seconds.to_f/3600).round
    if hours <= 48
      return {temperature: weather[:hourly_weather][hours].temperature, conditions: weather[:hourly_weather][hours].conditions}
    elsif hours <= 168
      days = (hours.to_f/24).round
        return {temperature: weather[:daily_weather][days].max_temp, conditions: weather[:daily_weather][days].conditions}
    else
      return {temperature: weather[:daily_weather][7].max_temp, conditions: weather[:daily_weather][7].conditions}
    end
  end
end

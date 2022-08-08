class HourlyWeather
attr_reader :time, :temperature, :conditions, :icon
  def initialize(data)
    @date = Time.at(data[:dt]).strftime("%c")
  	@time = Time.at(data[:dt])
  	@temperature = data[:temp]
  	@conditions = data[:weather][0][:description]
  	@icon = data[:weather][0][:icon]
  end
end

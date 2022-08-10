class MapQuestService
  def self.get_coordinates(city)
  	  response = Faraday.get("http://www.mapquestapi.com/geocoding/v1/address") do |faraday|
				faraday.params['key'] = ENV.fetch('map_quest_api_key', nil)
				faraday.params['location'] = city
  	  end
  	  JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_drive_time(to,from)
  	  response = Faraday.post("http://www.mapquestapi.com/directions/v2/route") do |faraday|
				faraday.params['key'] = ENV.fetch('map_quest_api_key', nil)
				faraday.params['to'] = to
				faraday.params['from'] = from
  	  end
  	  JSON.parse(response.body, symbolize_names: true)
  end
end

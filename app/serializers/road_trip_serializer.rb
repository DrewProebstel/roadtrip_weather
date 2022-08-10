class RoadTripSerializer
  def self.serialize(road_trip)
    {
      data: {
        id: nil,
        type: 'roadtrip',
        attributes: {
          start_city: road_trip.start_city,
          end_city: road_trip.end_city,
          travel_time: road_trip.travel_time,
          weather_at_eta: {
            temperature: road_trip.weather_at_eta[:temperature],
            conditions: road_trip.weather_at_eta[:conditions]

          }
        }
      }
    }
  end
end

class ImpossibleTripSerializer
  def self.serialize(origin,destination)
    {
      data: {
        id: nil,
        type: 'roadtrip',
        attributes: {
          start_city: origin,
          end_city: destination,
          travel_time: 'impossible',
          weather_at_eta: {
          }
        }
      }
    }
  end
end

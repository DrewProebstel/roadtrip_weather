class MapQuestFacade
  def self.find_coordinates(location)
  	data = MapQuestService.get_coordinates(location)
    data[:results][0][:locations][0][:latLng]
  end

  def self.find_drive_time(from, to)
    data = MapQuestService.get_drive_time(from,to)
    data[:route][:realTime]
  end
end

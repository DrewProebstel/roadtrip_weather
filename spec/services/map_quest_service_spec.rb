RSpec.describe MapQuestService do
  it 'returns data on geocode' do
    VCR.use_cassette("map_quest_service") do
    	data = MapQuestService.get_coordinates("boston,MA")

      expect(data).to be_a(Hash)
    	expect(data[:results][0][:locations][0][:latLng]).to be_a(Hash)
    	expect(data[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
    	expect(data[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
    end
  end
  it 'returns data on geocode' do
    VCR.use_cassette("map_quest_service_drive_time") do
    	data = MapQuestService.get_drive_time("boston,MA","portland,OR")

      expect(data).to be_a(Hash)
    	expect(data[:route][:realTime]).to be_a(Integer)
    end
  end
end

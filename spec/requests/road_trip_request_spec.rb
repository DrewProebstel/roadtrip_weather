require 'rails_helper'

RSpec.describe 'road trip request' do
  it 'returns road trip information' do
    VCR.use_cassette("road_trip_request") do
    user=  User.create(email:"drew@gmail.com", password: "test", password_confirmation: "test", api_key: "1234567890")
      headers = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": "jgn983hy48thw9begh98h4539h4"
                }


      post "/api/v1/road_trip", params: headers

      expect(response).to be_successful
      binding.pry
      created = JSON.parse(response.body, symbolize_names: true)

      expect(created[:data][:id]).to eq(nil)
      expect(created[:data][:attributes][:start_city]).to eq("Denver,CO")
      expect(created[:data][:attributes][:end_city]).to eq("Pueblo,CO")
      expect(created[:data][:attributes][:travel_time]).to be_a(String)
      expect(created[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(created[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end
  end
end

require 'rails_helper'

RSpec.describe 'road trip request' do
  it 'returns road trip information' do
    VCR.use_cassette("road_trip_request") do
    User.create(email:"drew@gmail.com", password: "test", password_confirmation: "test", api_key: "1234567890")
      headers = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": "1234567890"
                }


      post "/api/v1/road_trip", params: headers

      expect(response).to be_successful

      created = JSON.parse(response.body, symbolize_names: true)

      expect(created[:data][:id]).to eq(nil)
      expect(created[:data][:attributes][:start_city]).to eq("Denver,CO")
      expect(created[:data][:attributes][:end_city]).to eq("Pueblo,CO")
      expect(created[:data][:attributes][:travel_time]).to be_a(String)
      expect(created[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(created[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end
  end
  it 'returns road trip information for multiple day trips' do
    VCR.use_cassette("long_road_trip_request") do
    User.create(email:"drew@gmail.com", password: "test", password_confirmation: "test", api_key: "1234567890")
      headers = {
                "origin": "Seattle,WA",
                "destination": "Miami,FL",
                "api_key": "1234567890"
                }


      post "/api/v1/road_trip", params: headers

      expect(response).to be_successful

      created = JSON.parse(response.body, symbolize_names: true)

      expect(created[:data][:id]).to eq(nil)
      expect(created[:data][:attributes][:start_city]).to eq("Seattle,WA")
      expect(created[:data][:attributes][:end_city]).to eq("Miami,FL")
      expect(created[:data][:attributes][:travel_time]).to be_a(String)
      expect(created[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float)
      expect(created[:data][:attributes][:weather_at_eta][:conditions]).to be_a(String)
    end
  end
  it 'returns road trip information differently if the trip is inpossible' do
    VCR.use_cassette("island_trip_request") do
    User.create(email:"drew@gmail.com", password: "test", password_confirmation: "test", api_key: "1234567890")
      headers = {
                "origin": "Denver,CO",
                "destination": "Honolulu,HI",
                "api_key": "1234567890"
                }


      post "/api/v1/road_trip", params: headers

      expect(response).to be_successful

      created = JSON.parse(response.body, symbolize_names: true)

      expect(created[:data][:id]).to eq(nil)
      expect(created[:data][:attributes][:start_city]).to eq("Denver,CO")
      expect(created[:data][:attributes][:end_city]).to eq("Honolulu,HI")
      expect(created[:data][:attributes][:travel_time]).to eq("impossible")
      expect(created[:data][:attributes][:weather_at_eta]).to_not have_key("temperature")
      expect(created[:data][:attributes][:weather_at_eta]).to_not have_key("conditions")
    end
  end
  it 'returns returns an error with a bad api key' do
    VCR.use_cassette("road_trip_request_bad_api") do
    User.create(email:"drew@gmail.com", password: "test", password_confirmation: "test", api_key: "1234567890")
      headers = {
                "origin": "Denver,CO",
                "destination": "Pueblo,CO",
                "api_key": "turingschool"
                }


      post "/api/v1/road_trip", params: headers

      expect(response).to_not be_successful
    end
  end
end

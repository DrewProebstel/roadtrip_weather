require 'rails_helper'

RSpec.describe 'log in a user end point' do
  it 'returns a user with good credentials' do
    User.create(email:"drew@gmail.com", password: "test", password_confirmation: "test")
    headers = {
              "email": "drew@gmail.com",
              "password": "test",
              }


    post "/api/v1/sessions", params: headers

    expect(response).to be_successful


    created = JSON.parse(response.body, symbolize_names: true)

    expect(created[:data][:attributes][:api_key]).to be_a(String)
    expect(created[:data][:attributes][:email]).to be_a(String)
    expect(created[:data][:type]).to eq("users")
    expect(created[:data][:id]).to be_a(Integer)
  end
end

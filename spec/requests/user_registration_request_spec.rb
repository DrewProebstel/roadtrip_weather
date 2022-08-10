require 'rails_helper'

RSpec.describe 'register  a user endpoint' do
  it 'creates a user' do
    headers = {
              "email": "bobguy@example.com",
              "password": "password",
              "password_confirmation": "password"
              }

    user_count = User.all.length

    post "/api/v1/users", params: headers

    expect(response).to be_successful
    expect(User.all.length).to eq(user_count + 1)

    created = JSON.parse(response.body, symbolize_names: true)

    expect(created[:data][:attributes][:api_key]).to be_a(String)
    expect(created[:data][:attributes][:email]).to be_a(String)
    expect(created[:data][:type]).to eq("users")
    expect(created[:data][:id]).to be_a(Integer)
  end
  it 'creates a user with bad params' do
    headers = {
              "email": "bobguy@example.com",
              "password": "word",
              "password_confirmation": "password"
              }

    user_count = User.all.length

    post "/api/v1/users", params: headers

    expect(response).to_not be_successful
    expect(User.all.length).to eq(user_count)
  end
end

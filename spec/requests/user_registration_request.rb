require 'rails_helper'

RSpec.describe 'register  a user endpoint' do
  it 'creates a user' do
    headers = {
              "email": "whatever@example.com",
              "password": "password",
              "password_confirmation": "password"
              }

    user_count = User.all.length

    post "/api/v1/users", headers: headers

    expect(response).to be_successful
    expect(User.all.length).to eq(user_count + 1)

    created = JSON.parse(response.body, symbolize_names: true)
  end
end

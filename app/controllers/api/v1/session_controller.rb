class Api::V1::SessionController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UsersSerializer.serialize(user), status: 200
    else
      render json: {error: "bad email or password"}, status: 400
    end
  end
end

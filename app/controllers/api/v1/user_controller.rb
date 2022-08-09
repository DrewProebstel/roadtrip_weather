class Api::V1::UserController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      render json: UsersSerializer.serialize(user), status: :created
    else
      render json: {error: user.errors.full_messages.to_sentence}, status: 400
    end
  end
end


def user_params
  params.permit(:email, :password_confirmation, :password)
end

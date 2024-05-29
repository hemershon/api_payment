class UsersController < ApplicationController
  def create
    @user = User.create(user_params)
    if @user.valid?
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :ok, Serializer: UserSerializer, show_token: true
    else
      render json: { error: "User not found" }, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(name: user_params[:name])
    if @user
      token = encode_token({ user_id: @user.id })
      render json: { user: @user, token: token }, status: :ok, Serializer: UserSerializer, show_token: true
    else
      render json: { error: "Login not found" }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :password)
  end
end

class AuthenticationController < ApplicationController

  # POST /auth/login
  def login
    @user = User.find_by_username(params[:username])

    if @user&.authenticate(params[:password])
      token = jwt_encode(user_id: @user.id)
      render json: { token:, user: @user }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unauthorized
    end
  end
end

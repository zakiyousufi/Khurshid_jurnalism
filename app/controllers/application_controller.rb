class ApplicationController < ActionController::API
  include JsonWebToken

  # before_action :authenticate_request

  private

  def authenticate_request
    header = request.headers['Authorization']
    if header && header.split(' ').length == 2
      token = header.split(' ').last
      begin
        decoded = jwt_decode(token)
        @current_user = User.find(decoded[:user_id])
      rescue JWT::DecodeError
        render json: { error: 'Invalid token' }, status: :unauthorized
      end
    else
      render json: { error: 'Missing or invalid Authorization header' }, status: :unauthorized
    end
  end
end

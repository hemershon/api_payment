class ApplicationController < ActionController::API
<<<<<<< HEAD
=======
  before_action :authorize_request

  private

  def authorize_request
    header = request.headers[ 'Authorization']
    header = header.split(' ').last if header
    decoded = decode_token(header)
    @current_user = User.find(decoded[:user_id]) if decoded
  rescue ActiverRecord::RecordNotFound, JWT::DecodeError
    render json: { errors: 'Unauthorized' }, status: :unauthorized
  end

  def decode_token(token)
    JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
  end
>>>>>>> 16b87d6 (feat create project test for id2)
end

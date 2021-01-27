module Authenticate
  SECRET_KEY = Rails.application.secrets.secret_key_base. to_s

  def encode_token(payload)
    JWT.encode(payload, SECRET_KEY)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header # rubocop:disable Style/GuardClause
      token = auth_header.split(' ')[1]
      begin
        JWT.decode(token, SECRET_KEY, true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token # rubocop:disable Style/GuardClause
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    render json: { message: 'Please log in', loggedIn: false }, status: :unauthorized unless logged_in?
  end
end

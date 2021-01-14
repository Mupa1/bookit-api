class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :ensure_params_exist, only: :create

  def create
    user = User.new user_params
    if user.save
      user_serializer = parse_json user
      json_response 'Signed Up Successfully', true, { user: user_serializer }, :ok
    else
      json_response 'Something went wrong', false, {}, :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def ensure_params_exist
    return if params[:user].present?

    json_response 'Missing params', false, {}, :bad_request
  end
end

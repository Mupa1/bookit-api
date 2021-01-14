class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  include Response
  include Authenticate
  include SerializableResource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end
end

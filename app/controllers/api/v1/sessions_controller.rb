class Api::V1::SessionsController < Devise::SessionsController
  before_action :sign_in_params, only: :create
  before_action :load_user, only: :create
  before_action :authorized, only: %i[destroy]
  skip_before_action :verify_signed_out_user, only: :destroy

  def create
    if @user.valid_password?(sign_in_params[:password])
      sign_in 'User', @user
      token = encode_token({ user_id: @user.id })
      json_response 'Signed in Successfully', true, { user: UserSerializer.new(@user), token: token }, :ok
    else
      json_response 'Unauthorized', false, {}, :unauthorized
    end
  end

  def destroy
    sign_out @user
    json_response 'Log out Successfully', true, {}, :ok
  end

  private

  def sign_in_params
    params.require(:sign_in).permit(:email, :password)
  end

  def load_user
    @user = User.find_for_database_authentication(email: sign_in_params[:email])

    @user || json_response('Cannot get User', false, {}, :not_found)
  end
end

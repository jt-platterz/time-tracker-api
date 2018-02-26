module Api
  class AuthController < ApiController
    before_action :authenticate_user, only: :create
    skip_before_action :authenticate_request

    def create
      if @user
        render json: {
          authentication: {
            authToken: auth_token,
            user: @user
          }
        }
      else
        render json: {error: 'Invalid Username or Password'}, status: :unauthorized
      end
    end

    def me
      render json: {current_user: current_user}
    end

  private

    def authenticate_user
      @user = User.find_by(email: params[:email])
      return @user if @user && @user.authenticate(params[:password])
      
      nil
    end

    def auth_token
      JsonWebToken.encode(user_id: @user.id) if @user
    end
  end
end
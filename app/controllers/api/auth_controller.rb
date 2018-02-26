module Api
  class AuthController < ApiController
    skip_before_action :authenticate_request

    def create
      command = AuthenticateUser.call(params[:email], params[:password])

      if command.success?
        render json: {
          authentication: {
            authToken: command.result,
            user: command.user
          }
        }
      else
        render json: {error: command.errors}, status: :unauthorized
      end
    end

    def me
      render json: {current_user: current_user}
    end
  end
end
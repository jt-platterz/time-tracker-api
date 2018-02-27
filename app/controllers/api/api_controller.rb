module Api
  class ApiController < ApplicationController
    include ::ActionController::Serialization
    include Pundit

    before_action :set_cors_headers
    before_action :authenticate_request

    def authenticate_request
      render json: { error: 'Not Authorized' }, status: 401 unless current_user
    end

    def current_user
      @user ||= User.find(decoded_token['user_id']) if decoded_token
    end

    def decoded_token
      if http_auth_header
        return @decoded_auth_token ||= JWT.decode(http_auth_header, ENV['SECRET_KEY'], false)[0]
      end
    end
  
    def http_auth_header
      return headers['Authorization'].split(' ').last if headers['Authorization'].present?
    end

    def headers
      request.headers
    end

    def authorize(record, query = nil)
      record if super(record, query)
    end

    def set_cors_headers
      response.headers['Access-Control-Allow-Origin'] = request.headers['Origin'] || '*'                                                                                                                                                                                                     
      response.headers['Access-Control-Allow-Credentials'] = 'true'
    end
  end
end
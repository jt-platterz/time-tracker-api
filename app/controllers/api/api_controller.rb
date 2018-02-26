module Api
  class ApiController < ApplicationController
    include ::ActionController::Serialization
    include Pundit

    before_action :authenticate_request

    def authenticate_request
      render json: { error: 'Not Authorized' }, status: 401 unless current_user
    end

    def current_user
      @user ||= User.find(decoded_token[:user_id]) if decoded_token
    end

    def decoded_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
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
  end
end
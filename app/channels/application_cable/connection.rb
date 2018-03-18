module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_user
      puts self.current_user.id
    end

  private

    def params
      request.params
    end
    
    def find_user
      decoded_token = JWT.decode(params[:jwt], ENV['SECRET_KEY'], false)[0]

      User.find(decoded_token['user_id'])
    end

  end
end

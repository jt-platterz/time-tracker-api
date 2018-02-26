class AuthenticateUser
  prepend SimpleCommand

  attr_accessor :email, :password

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  def user
    user = User.find_by(email: email)
    return user if user && user.authenticate(password)

    errors.add :user_authentication, 'invalid creds'
    nil
  end
end
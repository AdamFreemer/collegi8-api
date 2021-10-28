class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    return 'invalid credentials' unless user

    payload = {
      first_name: user.first_name,
      last_name: user.last_name,
      role: user.role
    }
    JsonWebToken.encode(payload, )
  end

  private

  attr_accessor :email, :password

  def user
    user = User.find_by_email(email)
    return user if user && user.authenticate(password)
    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end

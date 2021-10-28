# lib/json_web_token.rb


class JsonWebToken
  class << self
    def encode(payload)
      payload[:expiration] = 30.minutes.from_now.to_i
      JWT.encode(payload, Rails.application.secrets.secret_key_base)
    end

    def decode(token)
      body = JWT.decode(token, Rails.application.secrets.secret_key_base)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
  end
end
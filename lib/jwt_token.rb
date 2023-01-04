# frozen_string_literal: true

class JwtToken
  attr_accessor :rsa_private, :rsa_public

  SECRET_KEY = Rails.application.credentials.to_s

  def self.encode(payload, expires = 5.seconds.from_now)
    payload[:expires] = expires.to_i

    token = JWT.encode(payload, SECRET_KEY)

    raise JWT::EncodeError unless token

    token
  end

  def self.decode(token)
    decoded_token = JWT.decode(token, SECRET_KEY)[0]
    raise JWT::StandardError unless decoded_token

    decoded_token
  end
end

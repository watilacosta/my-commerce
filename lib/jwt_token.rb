# frozen_string_literal: true

class JwtToken
  attr_accessor :rsa_private
  attr_accessor :rsa_public

  SECRET_KEY = Rails.application.credentials.to_s

  def self.encode(payload, expires = 24.hours.from_now)
    payload[:expires] = expires.to_i

    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded_token = JWT.decode(token, SECRET_KEY)[0]
  end
end

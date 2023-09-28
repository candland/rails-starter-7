# frozen_string_literal: true

module JsonToken
  extend self

  ALG = "HS256"
  SEC = Rails.application.credentials.jwt_secret

  def encode(payload, _expiration = nil)
    JWT.encode payload, SEC, ALG
  end

  def decode(token)
    decoded_token = JWT.decode token, SEC, ALG
    decoded_token.first
  rescue => e
    Rails.logger.error "JsonToken#decode error: #{e.message}"
  end
end

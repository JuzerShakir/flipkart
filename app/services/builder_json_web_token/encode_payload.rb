# Encodes payload
class BuilderJsonWebToken::EncodePayload < BuilderJsonWebToken::Base
  def initialize(exp = 1.week.from_now, payload)
    @payload = payload
    @payload[:exp]  = exp.to_i
  end

  def call
    JWT.encode(@payload, secret_key, algorithm)
  end
end
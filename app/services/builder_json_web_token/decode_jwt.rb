# Decodes JWT token
class BuilderJsonWebToken::DecodeJwt < BuilderJsonWebToken::Base
  def initialize(token)
    @token = token
  end

  def call
    decoded_jwt = JWT.decode(@token, secret_key, true, algorithm: algorithm)
    payload = decoded_jwt.first
    HashWithIndifferentAccess.new payload
  end
end
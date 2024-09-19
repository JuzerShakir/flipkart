class BuilderJsonWebToken::Base < ApplicationService
  private
  def secret_key
    Rails.application.credentials.dig(:secret_key_base)
  end

  def algorithm
    "HS512"
  end
end
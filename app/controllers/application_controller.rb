class ApplicationController < ActionController::Base
    before_action :authenticate_account!

    private

    def authenticate_account!
      token = request.headers["Authorization"]

      begin
        # will return JWT::DecodeError if decode fails
        payload = BuilderJsonWebToken::DecodeJwt.call token
        # will return ActiveRecord::RecordNotFound error if account is missing
        @current_account = AccountBlock::Account.find(payload[:account_id])

      rescue JWT::DecodeError => e
        render json: { errors: e.message }, status: :unauthorized
      rescue ActiveRecord::RecordNotFound => e
        render json: { errors: "Account Not Found" }, status: :not_found
      end
    end
end

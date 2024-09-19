class SessionBlock::SessionsController < ApplicationController
  def new
    @account = AccountBlock::Account.find_by_email(params[:email])

    if @account&.authenticate(params[:password])
      token = BuilderJsonWebToken::EncodePayload.call(account_id: @account.id)
      render json: { token: token, email: @account.email }, status: :ok

    else
      render json: { error: "unauthorized" }, status: :unauthorized
    end
  end
end
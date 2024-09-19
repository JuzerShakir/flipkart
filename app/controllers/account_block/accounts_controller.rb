class AccountBlock::AccountsController < ApplicationController
  def create
    @account = AccountBlock::Account.new(account_params)

    if @account.save
      render json: @account, status: :created
    else
      render json: { errors: @account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @account = AccountBlock::Account.find(params[:id])
    render json: @account, status: :ok
  end

  private

  def account_params
    params.permit(:email, :password)
  end
end
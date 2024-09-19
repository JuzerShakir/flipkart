class AccountBlock::AccountsController < ApplicationController
  skip_before_action :authenticate_account!, only: :create

  def create
    @account = AccountBlock::Account.new(account_params)

    if @account.save
      render json: @account, status: :created
    else
      render json: { errors: @account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @account, status: :ok
  end

  def update
    unless @account.update(update_params)
      render json: { errors: @account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @account.destroy
  end

  private

  def set_account
    @account = AccountBlock::Account.find(params[:id])
  end

  def account_params
    params.permit(:email, :password)
  end

  def update_params
    params.permit(:id, :email, :password, :first_name, :last_name)
  end
end
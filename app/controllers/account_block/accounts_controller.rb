class AccountBlock::AccountsController < ApplicationController
  skip_before_action :authenticate_account!, only: :create

  def index
    @accounts = AccountBlock::Account.all
    render json: @accounts, status: :ok
  end

  def create
    @account = AccountBlock::Account.new(account_params)

    if @account.save
      render json: @account, status: :created
    else
      render json: { errors: @account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    render json: @current_account, status: :ok
  end

  def update
    unless @current_account.update(update_params)
      render json: { errors: @current_account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @current_account.destroy
  end

  private

  def account_params
    params.permit(:email, :password)
  end

  def update_params
    params.permit(:id, :email, :password, :first_name, :last_name)
  end
end
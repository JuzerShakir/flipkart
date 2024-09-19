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

  def update
    @account = AccountBlock::Account.find(params[:id])
    unless @account.update(update_params)
      render json: { errors: @account.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @account = AccountBlock::Account.find(params[:id])
    @account.destroy
  end

  private

  def account_params
    params.permit(:email, :password)
  end

  def update_params
    params.permit(:id, :email, :password, :first_name, :last_name)
  end
end
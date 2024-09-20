class AccountBlock::AccountMailer < ApplicationMailer
  def welcome_email
    @account = params[:account]

    mail(to: @account.email, subject: "Welcome to Flipkart")
  end
end

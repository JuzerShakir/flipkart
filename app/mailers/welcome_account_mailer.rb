class WelcomeAccountMailer < ApplicationMailer
  def welcome_account
    @account = params[:account]

    mail(to: @account.email, subject: "Welcome to Flipkart")
  end
end

class ApplicationMailer < ActionMailer::Base
  default from: email_address_with_name(Rails.application.credentials.dig(:mail, :email), "Flipkart")
  layout 'mailer'
end

if Rails.env.development?
  # Admin User
  AdminUser.destroy_all

  AdminUser.create!(
    email: 'admin@flipkart.com',
    password: '123456',
    password_confirmation: '123456'
  )

  # Accounts
  AccountBlock::Account.destroy_all

  5.times do |i|
    AccountBlock::Account.create(
      email: "acc#{i + 1}@gmail.com",
      password: '123456'
    )
  end
end
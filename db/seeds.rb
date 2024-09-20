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

  # Product
  ProductBlock::Product.destroy_all

  20.times do |i|
    ProductBlock::Product.create(
      title: "title #{i}",
      description: "description for product #{i} should be more than 50 characters",
      price: (1..10000).to_a.sample
    )
  end
end
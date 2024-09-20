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
      email: Faker::Internet.email(domain: 'gmail.com'),
      password: '123456',
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name
    )
  end

  # Product
  ProductBlock::Product.destroy_all

  20.times do |i|
    ProductBlock::Product.create(
      title: "#{Faker::Device.manufacturer} #{Faker::Device.model_name}",
      description: Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false),
      price: Faker::Number.within(range: 100..9999)
    )
  end
end
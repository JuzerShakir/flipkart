if Rails.env.development?
  AdminUser.destroy_all

  AdminUser.create!(
    email: 'admin@flipkart.com',
    password: '123456',
    password_confirmation: '123456'
  )
end
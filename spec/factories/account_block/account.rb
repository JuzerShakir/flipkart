FactoryBot.define do
  factory :account, class: "AccountBlock::Account" do
    email { Faker::Internet.email(domain: 'gmail.com') }
    password { Faker::Internet.password(min_length: 8) }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
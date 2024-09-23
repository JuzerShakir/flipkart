FactoryBot.define do
  factory :product, class: "ProductBlock::Product" do
    title { "#{Faker::Device.manufacturer} #{Faker::Device.model_name}" }
    description { Faker::Lorem.paragraph_by_chars(number: 200, supplemental: false) }
    price { Faker::Number.within(range: 100..9999) }
  end
end
FactoryBot.define do
  factory :supplier do
    name { FFaker::Company.name}
    email { FFaker::Internet.email }
    category { FFaker::Product.product }
    phone { FFaker::PhoneNumber.phone_number }
  end
end

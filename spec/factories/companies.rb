FactoryBot.define do
  factory :company do
    company_name { Faker::Lorem.characters(number: 10) }
    description { Faker::Lorem.characters(number: 30) }
    phone_number { Faker::Lorem.characters(number: 11) }
    address { Faker::Lorem.characters(number: 10) }
  end
end
FactoryBot.define do
  factory :review do
    comment { Faker::Lorem.characters(number: 20) }
    user_id {1}
    score {3}
    gender {1}
    employment_status {1}
    company_id {1}
  end
end
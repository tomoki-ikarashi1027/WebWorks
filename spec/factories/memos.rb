FactoryBot.define do
  factory :memo do
    title { Faker::Lorem.characters(number:5) }
    body { Faker::Lorem.characters(number:20) }
  end
end
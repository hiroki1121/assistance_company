FactoryBot.define do
  factory :review do
    title { Faker::Lorem.sentence }
    comment { Faker::Lorem.sentence }
    score { Faker::Number.between(from: 1, to: 5) }
  end
end

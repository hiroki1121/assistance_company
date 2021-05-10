FactoryBot.define do
  factory :post do
    industry_id { Faker::Number.between(from: 2, to: 11) }
    company_name { Faker::Lorem.sentence }
    company_url { Faker::Internet.url }
    post_code { "#{Faker::Number.decimal_part(digits: 3)}-#{Faker::Number.decimal_part(digits: 4)}" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    address { "#{Gimei.city.kanji}#{Gimei.town.kanji}" }
    building_name { Faker::Lorem.sentence }
    employee_number { Faker::Number.between(from: 1, to: 5000) }
    division { Faker::Lorem.sentence }
    representative_name { Gimei.kanji }
    email { Faker::Internet.free_email }
    represent_phone_number { Faker::Number.decimal_part(digits: 11) }
    direct_phone_number { Faker::Number.decimal_part(digits: 11) }
    business_detail { Faker::Lorem.sentence }
    association :contracted_side_user
    after(:build) do |post|
      post.image.attach(io: File.open('public/test-image.jpg'), filename: 'test_image.png')
    end
  end
end

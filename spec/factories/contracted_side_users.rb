FactoryBot.define do
  factory :contracted_side_user do
    email { Faker::Internet.free_email }
    password { "1a"+Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { Gimei.last.kanji || Gimei.last.hiragana || Gimei.last.katakana }
    first_name { Gimei.first.kanji || Gimei.first.hiragana || Gimei.first.katakana }
    last_name_ruby { Gimei.last.katakana }
    first_name_ruby { Gimei.first.katakana }
  end
end

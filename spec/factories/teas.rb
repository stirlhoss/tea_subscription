FactoryBot.define do
  factory :tea do
    title { Faker::Tea.variety }
    description { Faker::Lorem.sentence(word_count: 10) }
    temperature { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    brew_time { Faker::Number.between(from: 180, to: 240) }
  end
end

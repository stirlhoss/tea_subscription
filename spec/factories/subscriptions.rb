FactoryBot.define do
  factory :subscription do
    title { Faker::FunnyName.two_word_name }
    price { Faker::Number.decimal(l_digits: 2, r_digits: 2) }
    status { 'Active' || 'Canceled' }
    frequency { 12 }
  end
end

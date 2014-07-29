# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    summ { Faker::Number.number(4) }
    currency { ["USD", "RUB", "EUR", "GBP"][rand(0..3)] }
    goal { Faker::Lorem.sentence }
    date { Faker::Business.credit_card_expiry_date} 
    association :wallet
    association :expense
  end
end

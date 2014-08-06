# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wallet do
    name { Faker::Lorem.word }
    summ { Faker::Number.number(4) }
    currency { ["USD", "RUB", "EUR", "GBP"][rand(0..3)] }
    association :user
  end
end

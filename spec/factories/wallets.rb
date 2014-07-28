# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wallet do
    name { Faker::Lorem.characters(20) }
    summ { Faker::Number.number(4) }
    currency { ["USD", "RUB", "EUR", "GBP"][rand(0..3)] }
    user { User.all[rand(0...User.all.size)] }
  end
end

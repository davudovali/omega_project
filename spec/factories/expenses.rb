# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense do
    name { Faker::Lorem.characters(20) }
    association :user
  end
end

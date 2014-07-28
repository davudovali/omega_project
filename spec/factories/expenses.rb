# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense do
    name { Faker::Lorem.characters(20) }
    user { User.all[rand(0...User.all.size)] }
  end
end

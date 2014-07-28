# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense do
    name { Faker::Lorem.word }
    user { User.all[rand(0...User.all.size)] }
  end
end

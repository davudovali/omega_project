# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    summ "9.99"
    goal "MyString"
    date "2014-07-26"
    type_of_transaction "MyString"
    string "MyString"
  end
end

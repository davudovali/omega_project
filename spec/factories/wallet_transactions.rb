# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :wallet_transaction do
    name "MyString"
    summ "9.99"
    date "2014-07-26"
  end
end

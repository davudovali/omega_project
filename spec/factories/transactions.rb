# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :transaction do
    summ { Faker::Number.number(4) }
    currency { ["USD", "RUB", "EUR", "GBP"][rand(0..3)] }
    goal { Faker::Lorem.sentence }
    date { Faker::Business.credit_card_expiry_date} 
    wallet { Wallet.all[rand(0...Wallet.all.size)] }
    expense { Expense.all[rand(0...Expense.all.size)] }
  end
end

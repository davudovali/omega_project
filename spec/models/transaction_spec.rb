require 'rails_helper'

describe Transaction do
  before(:all) do
    @expense = Expense.last || FactoryGirl.create(:expense)
    @wallet = Wallet.last || FactoryGirl.create(:wallet)
    @transaction = FactoryGirl.create(:transaction)
    @transaction.wallet = @wallet
    @transaction.expense = @expense
  end

  it "has wallet" do
    expect(@transaction.wallet.id).to be(@wallet.id)
  end

  it "has expense" do
    expect(@transaction.expense.id).to be(@expense.id)
  end

  it "has a valid factory" do
    expect(@transaction).to be_valid
  end


end
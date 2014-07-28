require 'rails_helper'

describe Transaction do
  before(:each) do
    @expense = FactoryGirl.create(:expense)
    @wallet = FactoryGirl.create(:wallet)
    @transaction = FactoryGirl.create(:transaction,
                                      wallet: @wallet,
                                      expense: @expense)
  end

  it "has wallet" do
    expect(@transaction.wallet).to be(@wallet)
  end

  it "has expense" do
    expect(@transaction.expense).to be(@expense)
  end

  it "has a valid factory" do
    expect(@transaction).to be_valid
  end


end
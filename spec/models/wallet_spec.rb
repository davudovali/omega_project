require 'rails_helper'

describe Wallet do
  before(:all) do
    @user = User.first || FactoryGirl.create(:user)
    @wallet = FactoryGirl.create(:wallet, user: @user)
    @transaction = FactoryGirl.create(:transaction, wallet: @wallet)
  end

  

  it "has user" do
    expect(@wallet.user.id).to be(@user.id)
  end

  it "has transaction" do
    expect(@wallet.transactions.first.id).to be(@transaction.id)
  end

  it "has a valid factory" do
    expect(@wallet).to be_valid
  end

end

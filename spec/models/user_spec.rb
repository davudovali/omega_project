require 'rails_helper'

describe User do
  before(:all) do
    @user = User.last || FactoryGirl.create(:user)
    @wallet =  FactoryGirl.create(:wallet, user: @user)
    @expense =  FactoryGirl.create(:expense, user: @user)
  end


  it "has wallet" do
    expect(@user.wallets.last.id).to be(@wallet.id)
  end

  it "has expense" do
    expect(@user.expenses.last.id).to be(@expense.id)
  end

  it "has a valid factory" do
    expect(@user).to be_valid
  end


end
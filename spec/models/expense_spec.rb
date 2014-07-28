require 'rails_helper'

describe Expense do
  before(:all) do
    @user = User.last || FactoryGirl.create(:user)
    @expense = FactoryGirl.create(:expense, user: @user)
    @transaction = FactoryGirl.create(:transaction, expense: @expense)
  end


  it "has user" do
    expect(@expense.user.id).to be(@user.id)
  end

  it "has transaction" do
    expect(@expense.transactions.last.id).to be(@transaction.id)
  end

  it "has a valid factory" do
    expect(@expense).to be_valid
  end


end
require 'rails_helper'

describe Expense do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @expense = FactoryGirl.create(:expense, user: @user)
    @transaction = FactoryGirl.create(:transaction, expense: @expense)
  end

  it "has user" do
    expect(@expense.user).to be(@user)
  end

  it "has transaction" do
    expect(@expense.transactions.first.id).to be(@transaction.id)
  end

  it "has a valid factory" do
    expect(@expense).to be_valid
  end


end
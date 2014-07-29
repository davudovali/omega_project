require 'rails_helper'

describe Expense do 
  it "has a valid factory" do
    expect(FactoryGirl.build(:expense)).to be_valid
  end

  it "has user association" do
    expect(FactoryGirl.build(:expense)).to respond_to(:user)
  end
end
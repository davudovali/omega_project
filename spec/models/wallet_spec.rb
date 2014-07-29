require 'rails_helper'

describe Wallet do
 it "has a valid factory" do
    expect(FactoryGirl.build(:wallet)).to be_valid
  end

  it "has user association" do
    expect(FactoryGirl.build(:wallet)).to respond_to(:user)
  end

  it "has transactions association" do
    expect(FactoryGirl.build(:wallet)).to respond_to(:transactions)
  end
end

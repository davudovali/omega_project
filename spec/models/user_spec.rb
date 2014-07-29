require 'rails_helper'

describe User do

  it "has wallet association" do
    expect(FactoryGirl.build(:user)).to respond_to(:wallets)
  end

  it "has expense association" do
    expect(FactoryGirl.build(:user)).to respond_to(:expenses)
  end

  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end


end
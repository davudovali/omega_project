require 'rails_helper'

describe Transaction do
  
  it "has wallet association" do
    expect(FactoryGirl.build(:transaction)).to respond_to(:wallet)
  end

  it "has expense association" do
    expect(FactoryGirl.build(:transaction)).to respond_to(:expense)
  end

  it "has a valid factory" do
    expect(FactoryGirl.build(:transaction)).to be_valid
  end


end
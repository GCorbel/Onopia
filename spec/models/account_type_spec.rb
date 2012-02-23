require File.dirname(__FILE__) + '/../spec_helper'

describe AccountType do

  before :each do
    @account_type = Factory.build(:account_type)
  end

  it "should be valid" do
    AccountType.new.should be_valid
  end
  
  it "should be capitalizable" do
    @account_type.label = "my Bank account"
    @account_type.capitalize.should == "MyBankAccount"
  end
end

require File.dirname(__FILE__) + '/../spec_helper'

describe AccountType do

  it { should have_many(:accounts) }
  it { should validate_presence_of(:label) }
  it { should allow_mass_assignment_of(:label) }
  
  it "should be capitalizable" do
    account_type = Factory.build(:account_type)
    account_type.label = "my Bank account"
    account_type.capitalize.should == "MyBankAccount"
  end
end

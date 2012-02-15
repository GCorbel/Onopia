require File.dirname(__FILE__) + '/../spec_helper'

describe Bank do
  it { should have_many(:accounts) }

  it { should validate_presence_of(:label) }
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:icon) }
  
  it { should allow_mass_assignment_of(:label) }
  it { should allow_mass_assignment_of(:url) }
  it { should allow_mass_assignment_of(:icon) }
  
  it "should be capitalizable" do
    bank = Factory.build(:bank)
    bank.label = "my Bank label"
    bank.capitalize.should == "MyBankLabel"
  end
end

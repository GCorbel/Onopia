require File.dirname(__FILE__) + '/../spec_helper'

describe Bank do  
  before :each do
    @bank = Factory.build(:bank)
  end
  
  it "should not be valid with empty label" do
    should_not_be_invalid_with_empty(@bank, "label")
  end
  
  it "should not be valid with empty label" do
    should_not_be_invalid_with_empty(@bank, "url")
  end
  
  it "should not be valid with empty label" do
    should_not_be_invalid_with_empty(@bank, "icon")
  end
  
  it "should be capitalizable" do
    @bank.label = "my Bank label"
    @bank.capitalize.should == "MyBankLabel"
  end
end

# encoding: utf-8
require 'spec_helper'

describe User do

  before {@account = Factory.build(:account)}
  
  it "should be invalid with empty login" do 
    should_be_invalid_with_empty(@account, "login")          
  end
  
  it "should be invalid with empty password" do 
    should_be_invalid_with_empty(@account, "password")          
  end
  
  it "should be invalid with empty type" do 
    should_be_invalid_with_empty(@account, "type_id")           
  end
  
  it "should be invalid with empty bank" do 
    should_be_invalid_with_empty(@account, "bank_id")         
  end
  
  def should_be_invalid_with_empty(object, field)
    object.send(field+"=", "")
    object.save
    object.errors[field].each do |error|
      puts error
    end
    object.errors[field].size.should == 1
    object.errors[field].first.should == "doit être rempli(e)" 
  end
  
end

# encoding: utf-8
require 'spec_helper'

describe User do

  before {@account = Account.create}
  
  it "should be invalid with empty login" do 
    should_be_invalid_with_empty(@account, "login")          
  end
  
  it "should be invalid with empty password" do 
    should_be_invalid_with_empty(@account, "password")          
  end
  
  it "should be invalid with empty type" do 
    should_be_invalid_with_empty(@account, "account_type_id")           
  end
  
  it "should be invalid with empty bank" do 
    should_be_invalid_with_empty(@account, "bank_id")         
  end
  
  def should_be_invalid_with_empty(object, field)
    object.send(field+"=", "")
    object.errors[field].size.should_not == 0
    object.errors[field].first.should == "doit être rempli(e)" 
  end
  
end

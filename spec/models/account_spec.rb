# encoding: utf-8
require 'spec_helper'

describe User do

  before {@account = Factory.build(:account)}
  
  it "should be invalid with empty login" do 
    @account.login = ""
    @account.save
    @account.errors[:login].size.should == 1
    @account.errors[:login].first.should == "doit être rempli(e)"          
  end
  
  it "should be invalid with empty password" do 
    @account.password = ""
    @account.save
    @account.errors[:password].size.should == 1
    @account.errors[:password].first.should == "doit être rempli(e)"          
  end
  
  it "should be invalid with empty type" do 
    @account.type_id = ""
    @account.save
    @account.errors[:type_id].size.should == 1
    @account.errors[:type_id].first.should == "doit être rempli(e)"          
  end
  
end

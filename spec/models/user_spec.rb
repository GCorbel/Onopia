# encoding: utf-8
require 'spec_helper'

describe User do

  before {@user = Factory.build(:user)}
  
  
  it "should return the username for to_s function" do
    @user.to_s.should == @user.username
  end
  
  it "should be inactive on creation" do 
    user = User.create(  :username => @user.username, 
                  :email => @user.email, 
                  :password => @user.password)
  
    user.save.should == true
    user.active.should == false            
  end
  
  it "should be invalid when an other account with same email exist" do
    @user.save
    user = User.create(  :username => 'another username', 
                  :email => @user.email, 
                  :password => 'another password')
                  
    
    user.errors[:email].size == 1
    user.errors[:email].first.should == "n'est pas disponible"
  end
  
  it "should be invalid when an other account with same username exist" do
    @user.save
    user = User.create(  :username => @user.username, 
                  :email => 'another@email.com', 
                  :password => 'another password')
                  
    
    user.errors[:username].size == 1
    user.errors[:username].first.should == "n'est pas disponible"
  end
  
  it "should be invalid with too short username" do
    user = User.create(   :email => @user.email,
                          :username => 'aa',
                          :password => @user.password)
    
    user.save == false
    user.errors[:username].size == 1
    user.errors[:username].first.should == "est trop court (au moins 3 caractères)"
  end
  
  it "should be invalid with too short password" do
    user = User.create(   :email => @user.email,
                          :username => @user.username,
                          :password => 'aaa')
    
    user.save == false
    user.errors[:password].size == 1
    user.errors[:password].first.should == "est trop court (au moins 4 caractères)"
  end
  
  it "should have an encrypted password" do
    user = User.create(  :username => @user.username, 
                  :email => @user.email, 
                  :password => @user.password)
                  
    user.perishable_token.should_not == ""
  end
  
  it "should be invalid with invalid email adress" do
    user = User.create(  :username => @user.username, 
                  :email => "aaaaaaaa", 
                  :password => @user.password)
            
    user.save.should == false
    user.errors[:email].size == 1
    user.errors[:email].first.should == "ne semble pas être une adresse email"
  end
  
end

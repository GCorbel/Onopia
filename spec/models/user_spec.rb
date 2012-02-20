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
  
  describe 'account function' do
    before(:each) do
      account1 = Factory.create(:account)
      @user.accounts << account1
      account1.user = @user
      account1.save
      
      account2 = Factory.create(:account)
      @user.accounts << account2
      account2.user = @user
      account2.save
      @user.save
      
      
      @category1 = Factory.create(:category)
      @category2 = Factory.create(:category)
      @category3 = Factory.create(:category)
      
      @date_start = Date.new(2011,1,1)
      @date_end = Date.new(2011,12,31)
      
      add_account -123.56, Date.new(2011,2,3), account1, @category1
      add_account 645.50, Date.new(2011,2,3), account2, @category1
      add_account -65.90, Date.new(2011,3,30), account1, @category2
      add_account 45.50, Date.new(2011,3,26), account2, @category3
    end
    
   describe "total" do
      it "should group by day when there is no options" do
        @options = {}
        test_amount(365, [521.94,45.50,-65.90])
      end
      
      it "should group by month where it's specified" do
        @options = {:period => 'month'}
        test_amount(12, [521.94,-20.4])
      end
      
      it "should group by category when it's specified" do 
        @options = {:group => 'category'}
        test_amount(3, [[@category1.label, 521.94],
                        [@category3.label, 45.50],
                        [@category2.label, -65.90]])
      end
    end
    
    describe "expenses" do
      before(:each) do
        @options = {:type => "expenses"}
      end
      
      it "should give the expenses when it's specified" do
        test_amount(365, [123.56,65.90])
      end
      
      it "should group by month where it's specified" do
        @options[:period] = 'month'
        test_amount(12, [123.56,65.90])
      end
      
      it "should group by category when it's specified" do 
        @options[:group] = "category"
        test_amount(2, [[@category1.label, 123.56],
                        [@category2.label, 65.90]])
      end
    end
    
    describe "incomes" do
      before(:each) do
        @options = {:type => "incomes"}
      end
      
      it "should give the expenses when it's specified" do
        test_amount(365, [645.50,45.50])
      end
      
      it "should group by month where it's specified" do
        @options[:period] = 'month'
        test_amount(12, [645.50,45.50])
      end
      
      it "should group by category when it's specified" do 
        @options[:group] = "category"
        test_amount(2, [[@category1.label, 645.50],
                        [@category3.label, 45.50]])
      end
    end
  end
  
  def test_amount(size, values)
    records = @user.amounts(@date_start, @date_end, @options)
    records.size.should == size
    (records - [0]).should == values
  end
end

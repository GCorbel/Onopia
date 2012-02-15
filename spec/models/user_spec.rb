# encoding: utf-8
require 'spec_helper'

describe User do

  it { should have_many(:accounts) }
  it { should have_many(:records).through(:accounts) }
  
  it { should belong_to(:theme) }
  
  it { should validate_presence_of(:password).with_message("est trop court (au moins 4 caractères)") }
  it { should validate_presence_of(:username).with_message("est trop court (au moins 3 caractères)") }
  it { should ensure_length_of(:password).is_at_least(4) }
  it { should ensure_length_of(:username).is_at_least(3) }
  it { should validate_format_of(:email).not_with('test@test').with_message(/ne semble pas être une adresse email/)}

  it { should allow_mass_assignment_of :username }
  it { should allow_mass_assignment_of :email }
  it { should allow_mass_assignment_of :password }
  it { should allow_mass_assignment_of :captcha }
  it { should allow_mass_assignment_of :captcha_key }
  
  before {@user = Factory.build(:user)}
  
  context "when another user exist" do
    before {@user = Factory.create(:user)}
  
    it { should validate_uniqueness_of(:email) }
    it { should validate_uniqueness_of(:username) }
  end
  
  
  it "should return the username for to_s function" do
    @user.to_s.should == @user.username
  end
  
  it "should be inactive on creation" do 
    user = User.create(  :username => @user.username, 
                  :email => @user.email, 
                  :password => @user.password)
    user.active.should == false            
  end
  
  it "should have an encrypted password" do
    user = User.create(  :username => @user.username, 
                  :email => @user.email, 
                  :password => @user.password)
                  
    user.perishable_token.should_not == ""
  end
  
  describe "years with records" do
    it "should give years with records" do
      account = Factory.create(:account)
      @user.accounts << account
      account.user = @user
      account.save
      
      
      category = Factory.create(:category)
      
      add_account -123.56, Date.new(2012,2,3), account, category
      add_account 12.56, Date.new(2012,2,3), account, category
      add_account 154.56, Date.new(2011,2,3), account, category
      add_account 123, Date.new(2010,2,3), account, category
      
      @user.years_with_records.should == [2012, 2011, 2010]
    end
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

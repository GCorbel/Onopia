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
  
  describe "years with records" do
    it "should give years with records" do
      @account = Factory.create(:account)      
      
      category = Factory.create(:category)
      
      add_account -123.56, Date.new(2012,2,3), @account, category
      add_account 12.56, Date.new(2012,2,3), @account, category
      add_account 154.56, Date.new(2011,2,3), @account, category
      add_account 123, Date.new(2010,2,3), @account, category
      
      @account.years_with_records.should == [2012, 2011, 2010]
    end
  end
  
  describe 'calcul functions' do
    before(:each) do
      @account = Factory.create(:account)
      @category1 = Factory.create(:category)
      @category2 = Factory.create(:category)
      @category3 = Factory.create(:category)
      
      @date_start = Date.new(2011,1,1)
      @date_end = Date.new(2011,12,31)
    
      add_account -123.56, Date.new(2011,2,3), @account, @category1
      add_account 645.50, Date.new(2011,2,3), @account, @category1
      add_account 45.50, Date.new(2011,3,26), @account, @category3
      add_account -65.90, Date.new(2011,3,30), @account, @category2
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
        @options[:group] = 'category'
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
    records = @account.amounts(@date_start, @date_end, @options)
    records.size.should == size
    (records - [0]).should == values
  end
end

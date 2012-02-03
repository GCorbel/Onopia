require File.dirname(__FILE__) + '/../spec_helper'

describe UsersController do
  fixtures :all
  render_views
  
  setup :activate_authlogic
  
  before(:each) do
    @user = login_user
  end

  describe 'json functions' do
    before(:each) do 
      @date_start = Date.new(2010, 1,1)
      @date_end = Date.new(2010, 1,3)
      
      User.any_instance.stubs(:records_for_periode).returns(@values)
    end
    
    after(:each) do
      check_amounts
    end
    
    describe "records" do
      before(:each) do 
        User.any_instance.stubs(:records_for_periode).returns(@values)
      end
      
      it "should search records for the date" do 
        @options = {}
      end
      
      it "should search records for the date with a group" do 
        @options = {"group" => "category"}
      end
    end

    describe "incomes" do
      before(:each) do 
        User.any_instance.stubs(:incomes_for_periode).returns(@values)
      end
      
      it "should search incomes for the date" do 
        @options = {"type" => "incomes"}
      end
      
      it "should search incomes for the date with a group" do 
        @options = {"type" => "incomes", "group" => "category"}
      end
    end
    
    describe "expenses" do
      before(:each) do 
        User.any_instance.stubs(:expenses_for_periode).returns(@values)
      end
      
      it "should search expenses" do 
        @options = {"type" => "expenses"}
      end
      
      it "should search expenses with a group" do 
        @options = {"type" => "expenses", "group" => "category"}
      end
    end
  end
    
  describe "records" do
    before(:each) do  
      @account1 = Factory.create(:account)
      @account1.user = @user
      
      @account2 = Factory.create(:account)
      @account2.user = @user
      
      @category1 = Factory.create(:category)
      @category2 = Factory.create(:category)
      @category3 = Factory.create(:category)
    end
    
    it "should render all the records for the period" do
      @date_start = Date.new(2010, 1,1)
      @date_end = Date.new(2010, 1,3) 
      
      @date_start = Date.new(2011,1,1)
      @date_end = Date.new(2011,12,31)
      
      add_account -123.56, Date.new(2011,2,3), @account1, @category1
      add_account 645.50, Date.new(2011,2,3), @account2, @category1
      add_account -65.90, Date.new(2011,3,30), @account1, @category2
      add_account 45.50, Date.new(2011,3,26), @account2, @category3
      
      rec = @user.records.search(:date_greater_than => @date_start, 
          :date_less_than => @date_end)
      get :records, :search => {
          :date_greater_than => @date_start, 
          :date_less_than => @date_end
        }, :format => :json, 
        :iDisplayLength => 10
    end
    
    describe "search" do
      before :each do
        Dir["#{Rails.root}/lib/**/*.rb"].each { |f| load f }
        @account1.type.label = "Codevi"
        @account1.bank.label = "Credit Agricole"
        BankReader::Reader.read(@account1)
        
        @account1.records.each do |record|
          record.category = @category1
          record.save
        end
      end
      
      it "must return all the result when the search is empty" do
        check_search("", 10, 50)
      end
      
      it "must return all the result when we search a record label" do
        check_search("TRESOR PUBLIC 75 IMPOT NUM 005002 ECH 17", 3, 3)
      end
      
      it "must return all the result when we search an amount" do
        check_search("80", 3, 3)
      end
      
      it "must return all the result when we seach a day" do
        check_search("23", 7, 7)
      end
    end
  end
  
  def check_amounts
    User.any_instance.expects(:amounts)
                  .with(@date_start, @date_end, @options)
    get :amounts, :stats => {
        :date_start => @date_start, 
        :date_end => @date_end,
        :options => @options
      }, :format => :json
  end
  
  def check_search search, result_number, total_number
    get :records, :sSearch => search, :iDisplayLength => 10, :format => :json
    parsed_body = ActiveSupport::JSON.decode(response.body)
    parsed_body["iTotalRecords"].should == 50
    parsed_body["iTotalDisplayRecords"].should == total_number
    parsed_body["aaData"].size.should == result_number
  end
end

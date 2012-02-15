# encoding: UTF-8
require File.dirname(__FILE__) + '/../spec_helper'

describe "manage accounts", :js => true do
  self.use_transactional_fixtures = false
  
  before(:each) do
    @user = Factory.create(:user, :active => true)
    @account = Factory.create(:account, :user => @user)
    @category1 = Factory.create(:category)
    @category2 = Factory.create(:category)
    
    @record = Factory.create( :record,
                              :label => 'My first label',
                              :date => '20120202',
                              :amount => 70,
                              :account => @account, 
                              :category => @category2)

    Factory.create( :record,
                    :label => 'My second label',
                    :date => '20120202',
                    :amount => 04,
                    :account => @account, 
                    :category => @category1)
                    
    Factory.create( :record,
                    :label => 'Another text',
                    :date => '20120203',
                    :amount => 70,
                    :account => @account, 
                    :category => @category1)
                    
    Factory.create( :record,
                    :label => 'The last label',
                    :date => '20120204',
                    :amount => 100,
                    :account => @account, 
                    :category => @category2)
                    
    login_user(@user)
    visit management_index_path
  end

  context "when the user change category of an account" do
    it "activate a user" do      
      select(@category2.label, :from => "category_id_#{@record.id}")
      wait_for_ajax
      
      Record.find(@record.id).category.should == @category2
    end
  end

  context "when the user want to search into his record" do
    it "return result" do
      search_for('', 4)
      search_for('label', 3)
      search_for('04', 1)
      search_for('Another text', 1)
      search_for('Something different', 0)
    end
  end
    
  def search_for(text, result)
    fill_in "Rechercher", :with => text
    page.should have_content("sur #{result.to_s} éléments")
  end
end

# encoding: UTF-8
require File.dirname(__FILE__) + '/../spec_helper'

describe Record do

  before :each do
    @category1 = Factory.create(:category, :label => 'Épicerie')
    @category2 = Factory.create(:category, :label => 'Salaire')
  end

  it "should be valid" do
    Record.new.should be_valid
  end
  
  it "should be uncategorized when there is no informations" do
    Record.new.category.should be_nil
  end
  
  
  it "should be categorized when there is informations" do
    Record.madeleine = nil
    create_record('Achat chez Intermarché', @category1)
    create_record('Achat chez Carrefour', @category1)
    create_record('Salaire du travail', @category2)
    
    label = 'Achat chez Leader Price'
    record = Factory.build(:record, :label => label, :category => nil)
    record.category.should == @category1 
  end
  
  describe "madeleine" do
    it "should change the class variable" do
      madeleine = SnapshotMadeleine.new("bayes_data") {
          Classifier::Bayes.new
      }
      Record.madeleine = madeleine
      Record.madeleine.should == madeleine
    end
    
    it "should initialize madeleine only for the first record" do
      Record.madeleine = nil
      Record.new
      Record.madeleine.should_not be_nil
      madeleine = Record.madeleine
      Record.new
      Record.madeleine.should == madeleine
    end
  end
  
  def create_record(label, category)
    record = Factory.create(:record, :label => label, :category => nil)
    record.train_for @category1
  end
end

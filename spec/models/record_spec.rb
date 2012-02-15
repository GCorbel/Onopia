# encoding: UTF-8
require File.dirname(__FILE__) + '/../spec_helper'

describe Record do
  it {should belong_to(:account)}
  it {should belong_to(:category)}
  it { should allow_mass_assignment_of(:label) }
  it { should allow_mass_assignment_of(:amount) }
  it { should allow_mass_assignment_of(:date) }

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
    Record.bayesian_system = nil
    create_record('Achat chez Intermarché', @category1)
    create_record('Achat chez Carrefour', @category1)
    work_record = create_record('Salaire du travail', @category2)
    create_record('Revenus banquaire', @category2)
    
    label = 'Salaire du travail'
    record = Factory.build(:record, :label => label, :category => nil)
    record.category.should == @category2 
    
    work_record.train_for(@category1)
    
    label = 'Salaire du travail'
    record = Factory.build(:record, :label => label, :category => nil)
    record.category.should == @category1 
    
    work_record.train_for(@category2)
    
    label = 'Salaire du travail'
    record = Factory.build(:record, :label => label, :category => nil)
    record.category.should == @category2 
    
    label = 'Achat chez Leader Price'
    record = Factory.build(:record, :label => label, :category => nil)
    record.category.should == @category1 
  end
  
  describe "bayesian system" do
    it "should change the class variable" do
      bayes = NaiveBayes.new()
      Record.bayesian_system = bayes
      Record.bayesian_system.should == bayes
    end
    
    it "should initialize the bayesian system only one time" do
      bayes = Record.bayesian_system
      Record.bayesian_system = nil
      Record.bayesian_system.should_not be_nil
      Record.bayesian_system.should_not == bayes
      bayes = Record.bayesian_system
      Record.bayesian_system.should == bayes
    end
    
    it "should store data" do
      NaiveBayes.any_instance.expects(:save)
      Record.store_bayesian_system
    end
  end
  
  def create_record(label, category)
    record = Factory.create(:record, :label => label, :category => nil)
    record.train_for category
    record
  end
end

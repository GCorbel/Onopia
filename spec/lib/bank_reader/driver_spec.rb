require File.dirname(__FILE__) + '/../../spec_helper'

module BankReader
  describe Driver do
  
    before :each do
      @account = Factory.build(:account)
      @account.bank.label = "Credit agricole"
      @account.type.label = "Codevi"
      @driver = Driver.findDriver(@account)
    end
    
    it "should find the right driver" do
      test_find_driver(@account, "Epargne", Drivers::CreditAgricoleEpargne)
      test_find_driver(@account, "Codevi", Drivers::CreditAgricoleCodevi)
    end
    
    it "should get the line number" do
      @driver.open_file("spec/data/example.csv")
      @driver.length.should == 50
    end
    
    it "should read lines" do
      @driver.open_file("spec/data/example.csv")
      @driver.read(0).should == {:date => Date.new(2009,03,17),
        :label => "PRELEVEMENT TRESOR PUBLIC 75 IMPOT NUM 005002 ECH 17",
        :amount => -1684
      }
    end
    
    it "should destroy the file"
  
    def test_find_driver(account, type, class_name)
      account.type.label = type
      driver = Driver.find_driver(account)
      driver.should be_an_instance_of(class_name)
    end
  end
end

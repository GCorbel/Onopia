require File.dirname(__FILE__) + '/../../spec_helper'

module BankReader
  describe Reader do
    before :each do
      Dir["#{Rails.root}/lib/**/*.rb"].each { |f| load f }
    end
  
    it "should download the remote file in the right folder"
    
    it "should create the file"
    
    it "should raise an error when login is bad"
    
    it "should raise an error when the host is unreachable"
    
    it "should create the right records" do
      account = Factory.build(:account)
      account.bank.label = "Credit agricole"
      account.type.label = "Codevi"
      
      lambda do
        Reader.read(account)
      end.should change(account.records, :count).by(50)
      
      lambda do
        Reader.read(account)
      end.should change(account.records, :count).by(0)
    end
  end
end

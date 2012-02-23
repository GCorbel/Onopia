module BankReader
  class Driver
    def self.find_driver(account)
      class_name = account.bank.capitalize + account.type.capitalize
      BankReader::Drivers.const_get(class_name).new
    end
  end
end

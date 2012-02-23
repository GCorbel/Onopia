module BankReader
  class Reader
  
    #Read a file with a driver and fill the records
    def self.read(account)
      driver = Driver.find_driver(account)
      path = get_path(account)
      driver.open_file(path)
      driver.length.times do |line|
        attributes = driver.read(line)
        if account.records.find(:all, :conditions => attributes).empty?
          record = Record.create(attributes)
          account.records << record
        end
      end
      account.save
    end
    
    def self.get_path account
      puts "TODO: faire la methode pour trouver le chemin d'un fichier selon le compte"
      "spec/data/example.csv"
    end
  end
end

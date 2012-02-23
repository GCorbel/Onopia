require 'pdf/toolkit'

module BankReader
  module Drivers
    class CreditAgricoleEpargne
    
      def open_file path
        @reader = PDF::Toolkit.open(path)
      end
      
      def length
        puts @reader.to_text.read
      end
      
      def read line
      end
    
    end
  end
end

require 'csv'
module BankReader
  module Drivers
    class CreditAgricoleCodevi
      def open_file(path)
        @reader = CSV.read(path, {:col_sep => "\t", :headers => true})
      end
      
      def length
        @reader.size
      end
      
      def read line
        {
          :date => Date.parse(@reader[line][0]),
          :label => @reader[line][1].split.join(" "),
          :amount => @reader[line][2].to_i
        }
      end
    end
  end
end

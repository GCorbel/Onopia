module BankAccount
  module ActsAsAccount
    extend ActiveSupport::Concern
 
    included do
    end
 
    module ClassMethods
      def acts_as_account(options = {})
      end
    end
    
    #give an array of the amounts with different options
    def amounts(date_start, date_end, options = {})
      select = "date(date) AS date, sum(amount) as amount, category_id"
      data = records.select(select)
                    .where(:date => date_start.beginning_of_day..
                            date_end.beginning_of_day)
                    .order("date(date)")
                    
      period = options[:period] || "to_date"
      
      #Check if the type that we want is incomes, expenses or all
      case options[:type]
      when "incomes"
        data = data.where("amount > 0")
      when "expenses"
        data = data.where("amount < 0")
        data = data.select("(sum(amount)*-1) as amount")
      end
      
      #Check if we want to group by category
      if options[:group] == "category"
        data = data.group("category_id")
      end
      
      #Check if we want to group by month
      if options[:period] == "month"
        data = data.group("strftime('%m',date)")
      elsif options[:group].nil?
        data = data.group("date(date)")
      end
      
      #Give all the data and put a 0 for empty values
      if options[:group] == "category"
        result = []
        data.each do | record |
          result << [record.category.label, record.amount.round(2).to_f]
        end
        result
      else
        (date_start.send("#{period}")..date_end.send("#{period}")).map do |date|
          sum = data.detect { |record| record.date.send("#{period}") == date }
          sum && sum.amount.round(2).to_f || 0
        end
      end
    end
  end
end

ActiveRecord::Base.send :include, BankAccount::ActsAsAccount

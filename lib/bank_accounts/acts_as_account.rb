module BankAccount
  module ActsAsAccount
    extend ActiveSupport::Concern
 
    included do
    end
 
    module ClassMethods
      def acts_as_account(options = {})
      end
    end
    
    #Unfortunatly we must to use a database specific SQL
    # to select the period
    def get_sql_for(period)
      adapter_type = connection.adapter_name.downcase.to_sym
      case adapter_type
          when :mysql
              "extract(#{period} from date)"
          when :sqlite
              if period == "year"
                period = "Y"
              else
                period = "m"
              end
              "strftime('%#{period}', date)"
          when :postgresql
              "#{period}(date)" 
          else
              throw NotImplementedError.new("Unknown adapter type '#{adapter_type}'")
      end
    end
    
    #get all years with records
    def years_with_records
      query = get_sql_for("year")
      records .select("#{query} as year")
              .group(query)
              .order("#{query} DESC").map do |record|
        record.year.to_i
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
        query = get_sql_for("month")
        data = data.group(query)
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

class Record < ActiveRecord::Base
  has_one :account
  has_one :balance
  has_one :category
  has_one :project
  
end

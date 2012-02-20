class Record < ActiveRecord::Base
  belongs_to :account
  belongs_to :balance
  belongs_to :category
  belongs_to :project
  
end

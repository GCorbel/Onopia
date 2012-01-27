class AccountType < ActiveRecord::Base
  has_many :account
  
  validate :label, :presence => true
end


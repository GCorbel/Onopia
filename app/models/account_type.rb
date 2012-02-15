class AccountType < ActiveRecord::Base

  has_many :accounts, :foreign_key => 'type_id'
  
  attr_accessible :label
  
  validates :label, :presence => true
  
  acts_as_capitalizable
end


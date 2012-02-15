class Account < ActiveRecord::Base

  belongs_to :user
  belongs_to :bank
  belongs_to :type, :class_name => "AccountType", :foreign_key => "type_id"
  has_many :records
  
  attr_accessible :login, :password, :balance, :bank_id, :type_id, :user_id
  
  validates :type, :presence => true
  validates :user, :presence => true
  validates :bank, :presence => true
  
  validates :login, :presence => true
  validates :password, :presence => true
end

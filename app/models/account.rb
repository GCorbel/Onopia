class Account < ActiveRecord::Base
  has_one :user
  has_one :bank
  has_one :account_type
  has_many :record
  has_many :project
  has_many :alert
  
  
  validates :type_id, :presence => true
  validates :user_id, :presence => true
  validates :bank_id, :presence => true
  
  validates :login, :presence => true
  validates :password, :presence => true
end

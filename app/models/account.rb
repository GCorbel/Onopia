class Account < ActiveRecord::Base
  belongs_to  :user
  belongs_to :bank
  belongs_to  :account_type
  has_many :record
  has_many :project
  has_many :alert
  
  
  validates :account_type_id, :presence => true
  validates :user_id, :presence => true
  validates :bank_id, :presence => true
  
  validates :login, :presence => true
  validates :password, :presence => true
end

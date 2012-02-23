class Account < ActiveRecord::Base

  belongs_to :user
  belongs_to :bank
  belongs_to :type, :class_name => "AccountType", :foreign_key => "type_id"
  has_many :records
  has_many :projects
  has_many :alerts
  
  validates :type, :presence => true
  validates :user_id, :presence => true
  validates :bank_id, :presence => true
  
  validates :login, :presence => true
  validates :password, :presence => true
end

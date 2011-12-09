class Account < ActiveRecord::Base
  has_one :user
  has_one :bank
  has_one :account_type
  has_many :record
  has_many :project
  has_many :alert
end

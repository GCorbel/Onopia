class Bank < ActiveRecord::Base
  has_many :account
  has_many :message
  has_many :account
end

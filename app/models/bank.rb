class Bank < ActiveRecord::Base

  validates :label, :presence => true
  validates :url, :presence => true
  validates :icon, :presence => true
  

  has_many :account
  has_many :message
  has_many :account
end

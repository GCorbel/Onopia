class Bank < ActiveRecord::Base

  validates :label, :presence => true
  validates :url, :presence => true
  validates :icon, :presence => true
  

  has_many :accounts
  has_many :messages
end

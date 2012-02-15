class Category < ActiveRecord::Base
  has_many :records
  
  attr_accessible :label
  
  validates :label, :presence => true
end

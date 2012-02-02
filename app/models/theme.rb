class Theme < ActiveRecord::Base
  has_many :users
  
  attr_accessible :label, :url
end

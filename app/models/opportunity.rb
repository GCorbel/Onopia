class Opportunity < ActiveRecord::Base
  has_one :user
end

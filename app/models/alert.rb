class Alert < ActiveRecord::Base
  has_one :user
  has_one :account
  has_one :category
end

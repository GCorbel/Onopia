class Message < ActiveRecord::Base
  has_one :bank
  has_one :user
end

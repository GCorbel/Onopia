class User < ActiveRecord::Base
  has_many :account
  has_many :alert
  has_many :budget
  has_many :message
  has_many :new
  has_many :opportunity
  
  validate :password, :presence => true

  apply_simple_captcha
  
  acts_as_authentic do |config|
    config.ignore_blank_passwords = false
    config.maintain_sessions = false
  end
  
end

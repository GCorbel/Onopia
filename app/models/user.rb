class User < ActiveRecord::Base
  has_many :accounts
  has_many :alerts
  has_many :budgets
  has_many :messages
  has_many :news
  has_many :opportunities
  
  belongs_to :theme
  
  validate :password, :presence => true
  validate :username, :presence => true

  apply_simple_captcha
  
  acts_as_authentic do |config|
    config.ignore_blank_passwords = true
    config.maintain_sessions = false
    config.require_password_confirmation = false
  end
  
  def to_s
    self.username
  end
  
end

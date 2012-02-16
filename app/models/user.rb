class User < ActiveRecord::Base
  has_many :accounts
  has_many :messages
  has_many :records, :through => :accounts
  
  belongs_to :theme
  
  validate :password, :presence => true
  validate :username, :presence => true
  
  attr_accessible :username, :email, :password, :captcha, :captcha_key,
                  :theme_id

  apply_simple_captcha
  
  acts_as_authentic do |config|
    config.ignore_blank_passwords = true
    config.maintain_sessions = false
    config.require_password_confirmation = false
  end
  
  acts_as_account
  
  def to_s
    self.username
  end
end

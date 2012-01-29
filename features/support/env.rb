require 'spork'
 
Spork.prefork do

  require 'rubygems'
  ENV["RAILS_ENV"] ||= "test"
  
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
  require 'cucumber/rails'
  require 'cucumber/rails/world'
  require 'email_spec'
  require 'email_spec/cucumber'
  require "authlogic/test_case"
  
  Capybara.javascript_driver = :selenium
  Capybara.default_selector = :css
  Capybara.server_port = 8200
  Capybara.app_host = "http://localhost:8200"

  require 'simplecov'
  SimpleCov.coverage_dir 'coverage/cucumber'
  SimpleCov.start 'rails'

end
 
Spork.each_run do
  ActionController::Base.allow_rescue = false
  Cucumber::Rails::World.use_transactional_fixtures = false
  load "#{Rails.root}/config/routes.rb"
  Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }
  I18n.backend.load_translations
end

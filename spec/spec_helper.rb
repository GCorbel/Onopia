require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  require "email_spec"
  require 'simplecov'  
  require "authlogic/test_case"
  require 'database_cleaner'
  
  SimpleCov.start 'rails'
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.mock_with :mocha
    config.fixture_path = "#{::Rails.root}/spec/fixtures"
    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
  
    config.before(:suite, :type => :request) do
      config.use_transactional_fixtures = false
      DatabaseCleaner.strategy = :truncation
    end

    config.before(:each, :type => :request) do
      DatabaseCleaner.start
    end

    config.after(:each, :type => :request) do
      DatabaseCleaner.clean
    end

    config.include(EmailSpec::Helpers)
    config.include(EmailSpec::Matchers)
  end

  include Authlogic::TestCase

  Capybara.javascript_driver = :webkit
  Capybara.default_selector = :css
end

Spork.each_run do
  load "#{Rails.root}/config/routes.rb"
  Dir["#{Rails.root}/lib/**/*.rb"].each { |f| load f }
  Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }
  I18n.backend.load_translations
end

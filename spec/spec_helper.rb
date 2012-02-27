require 'rubygems'
require 'spork'

Spork.prefork do
  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'capybara/rspec'
  require "email_spec"
  require 'simplecov'  
  require "authlogic/test_case"
  SimpleCov.start 'rails'

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    #config.mock_with :rspec

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    # If true, the base class of anonymous controllers will be inferred
    # automatically. This will be the default behavior in future versions of
    # rspec-rails.
    config.infer_base_class_for_anonymous_controllers = false
    
    config.include(EmailSpec::Helpers)
    config.include(EmailSpec::Matchers)
  end
  
  include Authlogic::TestCase
   
  def login_user(options = {})
    @logged_in_user = Factory.build(:user, options)
    @logged_in_user.active = true
    @logged_in_user.save!
    UserSession.create!(@logged_in_user)
    @logged_in_user
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
  load "#{Rails.root}/config/routes.rb"
  Dir["#{Rails.root}/app/**/*.rb"].each { |f| load f }
  Dir["#{Rails.root}/lib/**/*.rb"].each { |f| load f }
  I18n.backend.load_translations
end

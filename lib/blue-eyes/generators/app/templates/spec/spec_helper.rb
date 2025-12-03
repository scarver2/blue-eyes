# frozen_string_literal: true

# Ensure environment is set to test
ENV['RACK_ENV'] = ENV['SINATRA_ENV'] = 'test'

require_relative '../config/environment'
require 'capybara/rspec'
require 'capybara/dsl'
require 'factory_bot'
require 'pry'
require 'rack/test'

def app
  Rack::Builder.parse_file('config.ru')
end

# TODO: Check ActiveRecord version
# if ActiveRecord::Migrator.needs_migration?
#   raise 'Migrations are pending. Run `rake db:migrate SINATRA_ENV=test` to resolve the issue.'
# end
ActiveRecord::Base.logger = nil
ActiveRecord::Migration.check_all_pending!
Capybara.app = app
DatabaseCleaner.strategy = :truncation

configure :test do
  disable :protection
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.include Capybara::DSL
  config.include FactoryBot::Syntax::Methods
  config.include Rack::Test::Methods

  config.before do
    DatabaseCleaner.clean
  end

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.after do
    DatabaseCleaner.clean
  end
end

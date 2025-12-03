# frozen_string_literal: true

# set environment to development if not defined
ENV['RACK_ENV'] = ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require(:default, ENV.fetch('SINATRA_ENV', nil))

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/#{ENV.fetch('SINATRA_ENV', nil)}"
  # database: "db/#{ENV.fetch('SINATRA_ENV', nil)}.sqlite"
)

require './app/controllers/application_controller'
require_all 'app'

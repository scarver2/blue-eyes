# frozen_string_literal: true

# set environment to development if not defined
ENV['RACK_ENV'] = ENV['SINATRA_ENV'] ||= 'development'

require 'bundler/setup'
require 'sinatra'
require 'sinatra/activerecord'

Bundler.require(:default, ENV.fetch('SINATRA_ENV', nil))

set :database, {
  adapter: 'sqlite3',
  database: "db/#{ENV.fetch('SINATRA_ENV', nil)}.sqlite3"
}

require './app/controllers/application_controller'
require_all 'app'
